import Foundation

internal func cgfloatTweenInterpolator(from: CGFloat, to: CGFloat, easedValue: Float) -> CGFloat {
    from + (to - from) * CGFloat(easedValue)
}

/// Tween-specific extensions
public extension CGFloat {

    /// Create a tween between two `CGFloat` values
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: CGFloat, to: CGFloat, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGFloat> {
        let data = TweenData(from: from, to: to, interpolator: cgfloatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }
    
    /// Create a tween between two `CGFloat` values, with the starting value being obtained when the tween actually starts
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<CGFloat>.DeferredValueAccessor, to: CGFloat, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGFloat> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: cgfloatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
