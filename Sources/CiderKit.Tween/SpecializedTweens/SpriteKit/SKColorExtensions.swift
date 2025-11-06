import SpriteKit
import Foundation

internal func skcolorTweenInterpolator(from: SKColor, to: SKColor, easedValue: Float) -> SKColor {
    let tweenedCGColor = cgcolorTweenInterpolator(from: from.cgColor, to: to.cgColor, easedValue: easedValue)
    #if os(macOS)
    return SKColor(cgColor: tweenedCGColor)!
    #else
    return SKColor(cgColor: tweenedCGColor)
    #endif
}

internal func relativeSKColorAccessorFactory(_ by: SKColor) -> TweenData<SKColor>.RelativeValueAccessor {
    return { from in
        let fromCGColor = from.cgColor
        let byCGColor = by.cgColor

        let fromColorSpace = fromCGColor.colorSpace!
        let byColorSpace = byCGColor.colorSpace!

        let byConverted = fromColorSpace != byColorSpace ? byCGColor.converted(to: fromColorSpace, intent: .defaultIntent, options: nil)! : byCGColor

        let fromComponents = fromCGColor.components!
        let byComponents = byConverted.components!
        var relativeComponents = [CGFloat](repeating: 0, count: fromCGColor.numberOfComponents)
        for i in 0..<fromCGColor.numberOfComponents {
            relativeComponents[i] = fromComponents[i] + byComponents[i]
        }

        let resultColor = CGColor(colorSpace: fromColorSpace, components: relativeComponents)!
        #if os(macOS)
        return SKColor(cgColor: resultColor)!
        #else
        return SKColor(cgColor: resultColor)
        #endif
    }
}

/// Tween-specific extensions
public extension SKColor {

    /// Create a tween between two `SKColor` values
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SKColor>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SKColor> {
        let data = travel.toTweenData(interpolator: skcolorTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
