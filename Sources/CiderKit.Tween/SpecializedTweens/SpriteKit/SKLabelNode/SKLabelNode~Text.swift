import SpriteKit

public extension SKLabelNode {
    
    /// Tweens the `text` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenText(_ travel: TweenSimpleTravel<String>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<String> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.text ?? "" } }, relativeAccessorFactory: { by in { from in from + by }})
        let tween = await String.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedText in tween.onUpdate {
                    await MainActor.run { self.text = updatedText }
                }
            }
        }
        return tween
    }
    
    /// Tweens the `preferredMaxLayoutWidth` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenPreferredMaxLayoutWidth(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.preferredMaxLayoutWidth } }, relativeAccessorFactory: { by in { from in from + by }})
        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedPreferredMaxLayoutWidth in tween.onUpdate {
                    await MainActor.run { self.preferredMaxLayoutWidth = updatedPreferredMaxLayoutWidth }
                }
            }
        }
        return tween
    }
    
    /// Tweens the `numberOfLines` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenNumberOfLines(_ travel: TweenSimpleTravel<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<Int> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.numberOfLines } }, relativeAccessorFactory: { by in { from in from + by }})
        let tween = await Int.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedNumberOfLines in tween.onUpdate {
                    await MainActor.run { self.numberOfLines = updatedNumberOfLines }
                }
            }
        }
        return tween
    }
    
}
