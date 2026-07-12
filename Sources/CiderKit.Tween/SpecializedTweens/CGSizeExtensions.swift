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
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<CGSize>, options: TweenOptions) async -> Tween<CGSize> {
        let data = travel.toTweenData(interpolator: cgsizeTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}
