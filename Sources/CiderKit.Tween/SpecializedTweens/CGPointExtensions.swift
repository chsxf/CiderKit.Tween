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
    static func tween(from: CGPoint, to: CGPoint, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGPoint> {
        let data = TweenData(from: from, to: to, interpolator: cgpointTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}
