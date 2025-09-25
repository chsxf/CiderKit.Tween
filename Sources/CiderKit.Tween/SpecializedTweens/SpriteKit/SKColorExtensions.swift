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
