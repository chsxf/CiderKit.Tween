import SpriteKit

public extension SKNode {

    /// Scales a `SKNode` instance on both axis
    ///
    /// As `SKNode` provides only single-axis scale getters, we use the scale on the X axis as the starting scale
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func scale(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.xScale } },
                                                     relativeAccessorFactory: { by in { from in from + by } })
        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
        if setupUpdate {
            Task {
                for await updatedScale in tween.onUpdate {
                    await MainActor.run { self.setScale(updatedScale) }
                }
            }
        }
        return tween
    }

    /// Scales a `SKNode` instance on the X axis only
    ///
    /// As `SKNode` provides only single-axis scale getters, we use the scale on the X axis as the starting scale
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func scaleX(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.xScale } },
                                                     relativeAccessorFactory: { by in { from in from + by } })
        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
        if setupUpdate {
            Task {
                for await updatedScale in tween.onUpdate {
                    await MainActor.run { self.xScale = updatedScale }
                }
            }
        }
        return tween
    }

    /// Scales a `SKNode` instance on the Y axis only
    ///
    /// As `SKNode` provides only single-axis scale getters, we use the scale on the X axis as the starting scale
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func scaleY(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none, setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.yScale } },
                                                     relativeAccessorFactory: { by in { from in from + by } })
        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
        if setupUpdate {
            Task {
                for await updatedScale in tween.onUpdate {
                    await MainActor.run { self.yScale = updatedScale }
                }
            }
        }
        return tween
    }

}
