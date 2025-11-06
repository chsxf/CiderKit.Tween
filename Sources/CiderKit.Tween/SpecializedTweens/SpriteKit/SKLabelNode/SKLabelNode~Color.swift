import SpriteKit

public extension SKLabelNode {

    /// Tweens the `fontColor` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenFontColor(_ travel: TweenSimpleTravel<SKColor>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none,
                        setupUpdate: Bool = true) async -> Tween<SKColor> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.fontColor ?? SKColor.white } }, relativeAccessorFactory: relativeSKColorAccessorFactory(_:))
        let tween = await SKColor.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedColor in tween.onUpdate {
                    await MainActor.run { self.fontColor = updatedColor }
                }
            }
        }
        return tween
    }

    /// Tweens the `color` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenColor(_ travel: TweenSimpleTravel<SKColor>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none,
                    setupUpdate: Bool = true) async -> Tween<SKColor> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.color ?? SKColor.white } }, relativeAccessorFactory: relativeSKColorAccessorFactory(_:))
        let tween = await SKColor.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedColor in tween.onUpdate {
                    await MainActor.run { self.color = updatedColor }
                }
            }
        }
        return tween
    }

    /// Tweens the `colorBlendFactor` of a `SKLabelNode` instance
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenColorBlendFactor(_ travel: TweenSimpleTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none,
                               setupUpdate: Bool = true) async -> Tween<CGFloat> {
        let detailedTravel = travel.toDetailedTravel(deferredFrom: { await MainActor.run { self.colorBlendFactor } }, relativeAccessorFactory: { by in { from in from + by }})
        let tween = await CGFloat.tween(detailedTravel, duration: duration, easing: easing, manualUpdate: manualUpdate)
        if setupUpdate {
            Task {
                for await updatedColorBlendFactor in tween.onUpdate {
                    await MainActor.run { self.colorBlendFactor = updatedColorBlendFactor }
                }
            }
        }
        return tween
    }

}
