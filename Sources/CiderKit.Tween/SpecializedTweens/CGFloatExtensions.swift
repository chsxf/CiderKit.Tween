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
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<CGFloat>, options: TweenOptions) async -> Tween<CGFloat> {
        let data = travel.toTweenData(interpolator: cgfloatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

    internal func clamped(to: ClosedRange<CGFloat>) -> CGFloat {
        if self < to.lowerBound {
            return to.lowerBound
        }

        if self > to.upperBound {
            return to.upperBound
        }

        return self
    }

}
