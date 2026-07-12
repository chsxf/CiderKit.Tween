import Foundation

internal actor TweenInstanceActor<T: Sendable>: TweenInstance {

    private typealias UpdateFunction = (TimeInterval) async -> Void

    private let tweenData: TweenData<T>
    internal let options: TweenOptions

    internal private(set) var elapsedTime: TimeInterval = 0

    private var startValue: T
    internal private(set) var currentLoopNumber: UInt = 1
    internal private(set) var isRunning: Bool = true
    internal private(set) var isComplete: Bool = false

    private var startHasBeenNotified = false
    private var updateFunction: UpdateFunction!

    internal var loopCount: UInt { Self.computeLoopCount(loopingType: options.loopingType) }
    internal var isLooping: Bool { Self.computeIsLooping(loopCount: loopCount) }
    private var isLastLoop: Bool {
        let loopCount = loopCount
        return loopCount > 1 && currentLoopNumber == loopCount
    }

    private var isMovingForward: Bool {
        switch options.loopingType {
            case .pingPong:
                return currentLoopNumber % 2 == 1
            default:
                return true
        }
    }

    internal init(tweenData: TweenData<T>, options: TweenOptions) async {
        // If deferred, startValue can be wrong but we need to get an actual value if the tween is stopped before being started
        self.startValue = await tweenData.from

        self.tweenData = tweenData
        self.options = options

        let loopCount = Self.computeLoopCount(loopingType: options.loopingType)
        let isLooping = Self.computeIsLooping(loopCount: loopCount)
        if case .pingPong = options.loopingType {
            updateFunction = pingPongUpdate
        }
        else if isLooping {
            updateFunction = loopingUpdate
        }
        else {
            updateFunction = singleLoopUpdate
        }

        if !options.manualUpdate {
            await TweenManager.shared.register(tweenInstance: self)
        }
    }

    private static func computeLoopCount(loopingType: LoopingType) -> UInt {
        switch loopingType {
            case .none:
                return 1
            case .normal(let loopCount):
                return loopCount
            case .pingPong(let loopCount):
                return loopCount
        }
    }

    private static func computeIsLooping(loopCount: UInt) -> Bool {
        return loopCount == 0 || loopCount > 1
    }

    internal func update(additionalElapsedTime: TimeInterval) async {
        guard isRunning && !isComplete && additionalElapsedTime > 0 else {
            return
        }

        if elapsedTime == 0 && !startHasBeenNotified {
            startValue = await tweenData.deferredFrom()

            tweenData.notifyStart()
            startHasBeenNotified = true
        }

        await updateFunction(additionalElapsedTime)

        let elapsedTimeRatio = Float(elapsedTime / options.duration)
        let easedValue = options.easing.easingFunction()(elapsedTimeRatio)

        if isComplete {
            await stop(complete: isComplete)
        }
        else {
            tweenData.apply(from: startValue, easedValue: easedValue)
        }
    }

    private func singleLoopUpdate(additionalElapsedTime: TimeInterval) async {
        elapsedTime += additionalElapsedTime
        if elapsedTime >= options.duration {
            elapsedTime = options.duration
            isComplete = true
        }
    }

    private func loopingUpdate(additionalElapsedTime: TimeInterval) async {
        var loopCompleted = false
        let isLastLoop = isLastLoop

        elapsedTime += additionalElapsedTime
        if elapsedTime >= options.duration {
            loopCompleted = true
            if isLastLoop {
                elapsedTime = options.duration
                isComplete = true
            }
            else {
                elapsedTime = elapsedTime.truncatingRemainder(dividingBy: options.duration)
            }
        }

        if loopCompleted {
            tweenData.notifyLoopCompletion(loopNumber: currentLoopNumber)
            if !isLastLoop {
                currentLoopNumber += 1
            }
        }
    }

    private func pingPongUpdate(additionalElapsedTime: TimeInterval) async {
        var loopCompleted = false
        let isLastLoop = isLastLoop

        if isMovingForward {
            elapsedTime += additionalElapsedTime
            if elapsedTime >= options.duration {
                loopCompleted = true
                if isLastLoop {
                    elapsedTime = options.duration
                    isComplete = true
                }
                else {
                    elapsedTime = options.duration - elapsedTime.truncatingRemainder(dividingBy: options.duration)
                }
            }
        }
        else {
            elapsedTime -= additionalElapsedTime
            if elapsedTime <= 0 {
                loopCompleted = true
                if isLastLoop {
                    elapsedTime = 0
                    isComplete = true
                }
                else {
                    elapsedTime = -elapsedTime
                }
            }
        }

        if loopCompleted {
            tweenData.notifyLoopCompletion(loopNumber: currentLoopNumber)
            if !isLastLoop {
                currentLoopNumber += 1
            }
        }
    }

    internal func stop(complete: Bool = false) async {
        isRunning = false

        if complete {
            var completeEasedValue: Float = 1
            if case let .pingPong(loopCount) = options.loopingType, loopCount > 1, loopCount % 2 == 0 {
                completeEasedValue = 0
            }
            let easedValue = options.easing.easingFunction()(completeEasedValue)
            tweenData.apply(from: startValue, easedValue: easedValue)
        }
        tweenData.finish(complete: complete)

        if !options.manualUpdate {
            await TweenManager.shared.unregister(tweenInstance: self)
        }
    }

}
