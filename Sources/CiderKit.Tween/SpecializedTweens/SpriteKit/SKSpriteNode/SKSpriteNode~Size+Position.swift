import SpriteKit

public extension SKSpriteNode {
    
    /// Tweens the `size` of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenSize(_ travel: TweenSimpleTravel<CGSize>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGSize> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.size } },
            relativeAccessorFactory: { by in { from in CGSize(width: from.width + by.width, height: from.height + by.height) }}
        )
        let tween = await CGSize.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedSize in tween.onUpdate {
                    await MainActor.run { self.size = updatedSize }
                }
            }
        }
        return tween
    }
    
    /// Tweens the `anchorPoint` of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenAnchorPoint(_ travel: TweenSimpleTravel<CGPoint>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGPoint> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.anchorPoint } },
            relativeAccessorFactory: { by in { from in CGPoint(x: from.x + by.x, y: from.y + by.y) }}
        )
        let tween = await CGPoint.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedAnchorPoint in tween.onUpdate {
                    await MainActor.run { self.anchorPoint = updatedAnchorPoint }
                }
            }
        }
        return tween
    }
    
}
