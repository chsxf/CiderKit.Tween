import SpriteKit

public extension SKSpriteNode {
    
    /// Tweens the `centerRect` of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenCenterRect(_ travel: TweenSimpleTravel<CGRect>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGRect> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.centerRect } },
            relativeAccessorFactory: { by in { from in CGRect(x: from.minX + by.minX, y: from.minY + by.minY, width: from.width + by.width, height: from.height + by.height) }}
        )
        let tween = await CGRect.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedCenterRect in tween.onUpdate {
                    await MainActor.run { self.centerRect = updatedCenterRect }
                }
            }
        }
        return tween
    }
    
}
