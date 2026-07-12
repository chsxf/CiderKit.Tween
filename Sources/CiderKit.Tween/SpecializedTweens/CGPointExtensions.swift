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
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<CGPoint>, options: TweenOptions) async -> Tween<CGPoint> {
        let data = travel.toTweenData(interpolator: cgpointTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}
