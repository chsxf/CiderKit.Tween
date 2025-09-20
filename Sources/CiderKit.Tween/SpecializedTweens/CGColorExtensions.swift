import CoreGraphics
import Foundation

internal func cgcolorTweenInterpolator(from: CGColor, to: CGColor, easedValue: Float) -> CGColor {
    let fromColorSpace = from.colorSpace!
    let toColorSpace = to.colorSpace!

    let toConverted = fromColorSpace != toColorSpace ? to.converted(to: fromColorSpace, intent: .defaultIntent, options: nil)! : to

    let fromComponents = from.components!
    let toComponents = toConverted.components!
    var tweenedComponents = [CGFloat](repeating: 0, count: from.numberOfComponents)
    for i in 0..<from.numberOfComponents {
        tweenedComponents[i] = cgfloatTweenInterpolator(from: fromComponents[i], to: toComponents[i], easedValue: easedValue)
    }
    return CGColor(colorSpace: fromColorSpace, components: tweenedComponents)!
}

/// Tween-specific extensions
public extension CGColor {

    /// Create a tween between two `CGColor` values
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<CGColor>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<CGColor> {
        let data = travel.toTweenData(interpolator: cgcolorTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
