import Foundation

internal func cgfloatTweenInterpolator(from: CGFloat, to: CGFloat, easedValue: Float) -> CGFloat {
    from + (to - from) * CGFloat(easedValue)
}

/// Tween-specific extensions
public extension CGFloat {

    /// Create a tween between two `CGFloat` values
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<CGFloat>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGFloat> {
        let data = travel.toTweenData(interpolator: cgfloatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
