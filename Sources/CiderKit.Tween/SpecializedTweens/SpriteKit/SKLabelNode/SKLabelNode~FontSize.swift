import SpriteKit

public extension SKLabelNode {
    
    /// Tweens the `fontSize` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenFontSize(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.fontSize } }, relativeAccessorFactory: { by in { from in from + by }})
        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedFontSize in tween.onUpdate {
                    await MainActor.run { self.fontSize = updatedFontSize }
                }
            }
        }
        return tween
    }
    
}
