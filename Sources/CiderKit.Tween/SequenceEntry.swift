import Foundation

internal struct SequenceEntry: Sendable {

    let startAt: TimeInterval
    let sequence: Sequence?
    let tweenInstance: (any TweenInstance)?
    let duration: TimeInterval
    var elapsedTime: TimeInterval {
        get async {
            if let sequence {
                return await sequence.elapsedTime
            }
            if let tweenInstance {
                return await tweenInstance.elapsedTime
            }
            return 0
        }
    }

    init(startAt: TimeInterval, sequence: Sequence) async {
        self.startAt = startAt
        self.sequence = sequence
        tweenInstance = nil
        duration = await sequence.totalDuration
    }

    init(startAt: TimeInterval, tweenInstance: any TweenInstance) async {
        self.startAt = startAt
        sequence = nil
        self.tweenInstance = tweenInstance
        let loopCount = await tweenInstance.loopCount
        duration = loopCount == 0 ? 0 : await tweenInstance.duration * Double(loopCount)
    }

    func update(additionalElapsedTime: TimeInterval) async {
        await sequence?.update(additionalElapsedTime: additionalElapsedTime)
        await tweenInstance?.update(additionalElapsedTime: additionalElapsedTime)
    }

    func stop() async {
        await sequence?.stop(complete: false)
        await tweenInstance?.stop(complete: false)
    }

}
