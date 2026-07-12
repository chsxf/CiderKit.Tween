import Foundation

internal func cgvectorTweenInterpolator(from: CGVector, to: CGVector, easedValue: Float) -> CGVector {
    CGVector(
        dx: doubleTweenInterpolator(from: from.dx, to: to.dx, easedValue: easedValue),
        dy: doubleTweenInterpolator(from: from.dy, to: to.dy, easedValue: easedValue)
    )
}

/// Tween-specific extensions
public extension CGVector {

    /// Create a tween between two `CGVector` values
    ///
    /// The tween is applied independently to the `x` and `y` values of `CGVector`.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<CGVector>, options: TweenOptions) async -> Tween<CGVector> {
        let data = travel.toTweenData(interpolator: cgvectorTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}
