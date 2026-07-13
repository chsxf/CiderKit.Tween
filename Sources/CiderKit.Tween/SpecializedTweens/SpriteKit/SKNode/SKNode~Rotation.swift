import SpriteKit

public extension SKNode {

    /// Rotates a `SKNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func rotate(_ travel: TweenSimpleTravel<CGFloat>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.zRotation } },
                                                     relativeAccessorFactory: { by in { from in from + by } })
        let tween = await CGFloat.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedRotation in await tween.onUpdate {
                    await MainActor.run { self.zRotation = updatedRotation }
                }
            }
        }
        return tween
    }

}
