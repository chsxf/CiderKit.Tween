import SpriteKit

public extension SKSpriteNode {

    /// Tweens the `centerRect` of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenCenterRect(_ travel: TweenSimpleTravel<CGRect>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGRect> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.centerRect } },
            relativeAccessorFactory: { by in { from in CGRect(x: from.minX + by.minX, y: from.minY + by.minY, width: from.width + by.width, height: from.height + by.height) }}
        )
        let tween = await CGRect.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedCenterRect in await tween.onUpdate {
                    await MainActor.run { self.centerRect = updatedCenterRect }
                }
            }
        }
        return tween
    }

}
