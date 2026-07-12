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
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<CGRect>, options: TweenOptions) async -> Tween<CGRect> {
        let data = travel.toTweenData(interpolator: cgrectTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}
