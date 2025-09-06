import Foundation

internal func cgrectTweenInterpolator(from: CGRect, to: CGRect, easedValue: Float) -> CGRect {
    CGRect(
        x: cgfloatTweenInterpolator(from: from.minX, to: to.minX, easedValue: easedValue),
        y: cgfloatTweenInterpolator(from: from.minY, to: to.minY, easedValue: easedValue),
        width: cgfloatTweenInterpolator(from: from.width, to: to.width, easedValue: easedValue),
        height: cgfloatTweenInterpolator(from: from.height, to: to.height, easedValue: easedValue)
    )
}

/// Tween-specific extensions
public extension CGRect {

    /// Create a tween between two `CGRect` values
    ///
    /// The tween is applied independently to the `minX`, `minY`, `width`, and `height` values of `CGRect`.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: CGRect, to: CGRect, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGRect> {
        let data = TweenData(from: from, to: to, interpolator: cgrectTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }
    
    /// Create a tween between two `CGRect` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to the `minX`, `minY`, `width`, and `height` values of `CGRect`.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<CGRect>.DeferredValueAccessor, to: CGRect, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGRect> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: cgrectTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
