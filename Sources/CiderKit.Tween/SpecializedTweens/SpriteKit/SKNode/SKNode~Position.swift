import SpriteKit

public extension SKNode {

    /// Moves a `SKNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func move(_ travel: TweenSimpleTravel<CGPoint>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGPoint> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.position } },
                                                    relativeAccessorFactory: { by in { from in CGPoint(x: from.x + by.x, y: from.y + by.y) } })
        let tween = await CGPoint.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedPosition in await tween.onUpdate {
                    await MainActor.run { self.position = updatedPosition }
                }
            }
        }
        return tween
    }

    /// Moves a `SKNode` instance on the X axis only
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func moveX(_ travel: TweenSimpleTravel<CGFloat>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.position.x } },
                                                    relativeAccessorFactory: { by in { from in from + by } })
        let tween = await CGFloat.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedPosition in await tween.onUpdate {
                    await MainActor.run {
                        var pos = self.position
                        pos.x = updatedPosition
                        self.position = pos
                    }
                }
            }
        }
        return tween
    }

    /// Moves a `SKNode` instance on the Y axis only
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func moveY(_ travel: TweenSimpleTravel<CGFloat>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.position.y } },
                                                    relativeAccessorFactory: { by in { from in from + by } })

        let tween = await CGFloat.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedPosition in await tween.onUpdate {
                    await MainActor.run {
                        var pos = self.position
                        pos.y = updatedPosition
                        self.position = pos
                    }
                }
            }
        }
        return tween
    }

    /// Moves a `SKNode` instance on the Z axis only
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func moveZ(_ travel: TweenSimpleTravel<CGFloat>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.zPosition } },
                                                    relativeAccessorFactory: { by in { from in from + by } })

        let tween = await CGFloat.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedPosition in await tween.onUpdate {
                    await MainActor.run { self.zPosition = updatedPosition }
                }
            }
        }
        return tween
    }

}
