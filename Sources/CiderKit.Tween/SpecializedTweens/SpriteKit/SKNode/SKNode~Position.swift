import SpriteKit

public extension SKNode {

    /// Moves a `SKNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func move(_ travel: TweenSimpleTravel<CGPoint>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGPoint> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.position } },
                                                    relativeAccessorFactory: { by in { from in CGPoint(x: from.x + by.x, y: from.y + by.y) } })
        let tween = await CGPoint.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
        if setupUpdate {
            Task {
                for await updatedPosition in tween.onUpdate {
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
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func moveX(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.position.x } },
                                                    relativeAccessorFactory: { by in { from in from + by } })
        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
        if setupUpdate {
            Task {
                for await updatedPosition in tween.onUpdate {
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
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func moveY(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.position.y } },
                                                    relativeAccessorFactory: { by in { from in from + by } })

        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
        if setupUpdate {
            Task {
                for await updatedPosition in tween.onUpdate {
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
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func moveZ(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.zPosition } },
                                                    relativeAccessorFactory: { by in { from in from + by } })

        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
        if setupUpdate {
            Task {
                for await updatedPosition in tween.onUpdate {
                    await MainActor.run { self.zPosition = updatedPosition }
                }
            }
        }
        return tween
    }

}
