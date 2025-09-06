import Foundation

internal func cgpointTweenInterpolator(from: CGPoint, to: CGPoint, easedValue: Float) -> CGPoint {
    CGPoint(
        x: cgfloatTweenInterpolator(from: from.x, to: to.x, easedValue: easedValue),
        y: cgfloatTweenInterpolator(from: from.y, to: to.y, easedValue: easedValue)
    )
}

/// Tween-specific extensions
public extension CGPoint {

    /// Create a tween between two `CGPoint` values
    ///
    /// The tween is applied independently to the `x` and `y` values of `CGPoint`.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: CGPoint, to: CGPoint, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGPoint> {
        let data = TweenData(from: from, to: to, interpolator: cgpointTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }
    
    /// Create a tween between two `CGPoint` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to the `x` and `y` values of `CGPoint`.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<CGPoint>.DeferredValueAccessor, to: CGPoint, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGPoint> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: cgpointTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
