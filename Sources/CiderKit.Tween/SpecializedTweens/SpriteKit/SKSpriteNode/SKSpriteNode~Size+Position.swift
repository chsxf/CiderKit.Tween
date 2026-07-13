import SpriteKit

public extension SKSpriteNode {

    /// Tweens the `size` of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenSize(_ travel: TweenSimpleTravel<CGSize>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGSize> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.size } },
            relativeAccessorFactory: { by in { from in CGSize(width: from.width + by.width, height: from.height + by.height) }}
        )
        let tween = await CGSize.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedSize in await tween.onUpdate {
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
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenAnchorPoint(_ travel: TweenSimpleTravel<CGPoint>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGPoint> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.anchorPoint } },
            relativeAccessorFactory: { by in { from in CGPoint(x: from.x + by.x, y: from.y + by.y) }}
        )
        let tween = await CGPoint.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedAnchorPoint in await tween.onUpdate {
                    await MainActor.run { self.anchorPoint = updatedAnchorPoint }
                }
            }
        }
        return tween
    }

}
