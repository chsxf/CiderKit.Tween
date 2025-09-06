import Foundation

internal func cgsizeTweenInterpolator(from: CGSize, to: CGSize, easedValue: Float) -> CGSize {
    CGSize(
        width: cgfloatTweenInterpolator(from: from.width, to: to.width, easedValue: easedValue),
        height: cgfloatTweenInterpolator(from: from.height, to: to.height, easedValue: easedValue)
    )
}

/// Tween-specific extensions
public extension CGSize {

    /// Create a tween between two `CGSize` values
    ///
    /// The tween is applied independently to the `width` and `height` values of `CGSize`.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: CGSize, to: CGSize, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGSize> {
        let data = TweenData(from: from, to: to, interpolator: cgsizeTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }
    
    /// Create a tween between two `CGSize` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to the `width` and `height` values of `CGSize`.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value acccessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<CGSize>.DeferredValueAccessor, to: CGSize, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGSize> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: cgsizeTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
