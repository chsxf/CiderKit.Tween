import Foundation

internal actor TweenInstance {

    private typealias UpdateFunction = (TimeInterval) async -> Void

    private let tweenData: any Tweenable
    internal let manualUpdate: Bool

    internal let duration: TimeInterval
    internal private(set) var elapsedTime: TimeInterval = 0

    internal let easing: Easing
    internal let loopingType: LoopingType

    internal private(set) var currentLoopNumber: UInt = 1
    internal private(set) var isRunning: Bool = true
    internal private(set) var isComplete: Bool = false

    private var startHasBeenNotified = false
    private var updateFunction: UpdateFunction!

    internal var loopCount: UInt { Self.computeLoopCount(loopingType: loopingType) }
    internal var isLooping: Bool { Self.computeIsLooping(loopCount: loopCount) }
    private var isLastLoop: Bool {
        let loopCount = loopCount
        return loopCount > 1 && currentLoopNumber == loopCount
    }

    private var isMovingForward: Bool {
        switch loopingType {
            case .pingPong:
                return currentLoopNumber % 2 == 1
            default:
                return true
        }
    }

    internal init(tweenData: any Tweenable, duration: TimeInterval, easing: Easing, manualUpdate: Bool, loopingType: LoopingType) async {
        self.tweenData = tweenData
        self.manualUpdate = manualUpdate

        self.duration = duration
        self.easing = easing
        self.loopingType = loopingType

        let loopCount = Self.computeLoopCount(loopingType: loopingType)
        let isLooping = Self.computeIsLooping(loopCount: loopCount)
        if case .pingPong = loopingType {
            updateFunction = pingPongUpdate
        }
        else if isLooping {
            updateFunction = loopingUpdate
        }
        else {
            updateFunction = singleLoopUpdate
        }

        if !manualUpdate {
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
            tweenData.notifyStart()
            startHasBeenNotified = true
        }

        await updateFunction(additionalElapsedTime)

        let elapsedTimeRatio = Float(elapsedTime / duration)
        let easedValue = easing.easingFunction()(elapsedTimeRatio)

        if isComplete {
            await stop(complete: isComplete)
        }
        else {
            tweenData.apply(easedValue: easedValue)
        }
    }

    private func singleLoopUpdate(additionalElapsedTime: TimeInterval) async {
        elapsedTime += additionalElapsedTime
        if elapsedTime >= duration {
            elapsedTime = duration
            isComplete = true
        }
    }

    private func loopingUpdate(additionalElapsedTime: TimeInterval) async {
        var loopCompleted = false
        let isLastLoop = isLastLoop

        elapsedTime += additionalElapsedTime
        if elapsedTime >= duration {
            loopCompleted = true
            if isLastLoop {
                elapsedTime = duration
                isComplete = true
            }
            else {
                elapsedTime = elapsedTime.truncatingRemainder(dividingBy: duration)
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
            if elapsedTime >= duration {
                loopCompleted = true
                if isLastLoop {
                    elapsedTime = duration
                    isComplete = true
                }
                else {
                    elapsedTime = duration - elapsedTime.truncatingRemainder(dividingBy: duration)
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
            if case let .pingPong(loopCount) = loopingType, loopCount > 1, loopCount % 2 == 0 {
                completeEasedValue = 0
            }
            let easedValue = easing.easingFunction()(completeEasedValue)
            tweenData.apply(easedValue: easedValue)
        }
        tweenData.finish(complete: complete)

        if !manualUpdate {
            await TweenManager.shared.unregister(tweenInstance: self)
        }
    }

}
