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
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<CGVector>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGVector> {
        let data = travel.toTweenData(interpolator: cgvectorTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
