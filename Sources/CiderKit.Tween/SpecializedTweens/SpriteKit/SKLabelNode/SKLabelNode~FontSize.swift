import SpriteKit

public extension SKLabelNode {

    /// Tweens the `fontSize` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenFontSize(_ travel: TweenSimpleTravel<CGFloat>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.fontSize } }, relativeAccessorFactory: { by in { from in from + by }})
        let tween = await CGFloat.tween(detailedTravel, options: options)
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
