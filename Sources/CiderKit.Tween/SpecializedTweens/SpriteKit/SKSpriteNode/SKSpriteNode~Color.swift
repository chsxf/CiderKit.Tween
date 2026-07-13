import SpriteKit

public extension SKSpriteNode {

    /// Tweens the `color` of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenColor(_ travel: TweenSimpleTravel<SKColor>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<SKColor> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.color } }, relativeAccessorFactory: relativeSKColorAccessorFactory(_:))
        let tween = await SKColor.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedColor in await tween.onUpdate {
                    await MainActor.run { self.color = updatedColor }
                }
            }
        }
        return tween
    }

    /// Tweens the `colorBlendFactor` of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenColorBlendFactor(_ travel: TweenSimpleTravel<CGFloat>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.colorBlendFactor } }, relativeAccessorFactory: { by in { from in from + by }})
        let tween = await CGFloat.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedColorBlendFactor in await tween.onUpdate {
                    await MainActor.run { self.colorBlendFactor = updatedColorBlendFactor }
                }
            }
        }
        return tween
    }

}
