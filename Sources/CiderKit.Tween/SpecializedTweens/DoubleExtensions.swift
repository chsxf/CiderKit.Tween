import Foundation

internal func doubleTweenInterpolator(from: Double, to: Double, easedValue: Float) -> Double {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension Double {

    /// Create a tween between two `Double` values
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<Double> {
        let data = travel.toTweenData(interpolator: doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd2doubleTweenInterpolator(from: SIMD2<Double>, to: SIMD2<Double>, easedValue: Float) -> SIMD2<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD2<Double> {

    /// Create a tween between two `SIMD2<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD2<Double>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD2<Double>> {
        let data = travel.toTweenData(interpolator: simd2doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd3doubleTweenInterpolator(from: SIMD3<Double>, to: SIMD3<Double>, easedValue: Float) -> SIMD3<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD3<Double> {

    /// Create a tween between two `SIMD3<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD3<Double>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD3<Double>> {
        let data = travel.toTweenData(interpolator: simd3doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd4doubleTweenInterpolator(from: SIMD4<Double>, to: SIMD4<Double>, easedValue: Float) -> SIMD4<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD4<Double> {

    /// Create a tween between two `SIMD4<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD4<Double>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD4<Double>> {
        let data = travel.toTweenData(interpolator: simd4doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd8doubleTweenInterpolator(from: SIMD8<Double>, to: SIMD8<Double>, easedValue: Float) -> SIMD8<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD8<Double> {

    /// Create a tween between two `SIMD8<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD8<Double>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD8<Double>> {
        let data = travel.toTweenData(interpolator: simd8doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd16doubleTweenInterpolator(from: SIMD16<Double>, to: SIMD16<Double>, easedValue: Float) -> SIMD16<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD16<Double> {

    /// Create a tween between two `SIMD16<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD16<Double>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD16<Double>> {
        let data = travel.toTweenData(interpolator: simd16doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd32doubleTweenInterpolator(from: SIMD32<Double>, to: SIMD32<Double>, easedValue: Float) -> SIMD32<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD32<Double> {

    /// Create a tween between two `SIMD32<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD32<Double>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD32<Double>> {
        let data = travel.toTweenData(interpolator: simd32doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd64doubleTweenInterpolator(from: SIMD64<Double>, to: SIMD64<Double>, easedValue: Float) -> SIMD64<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD64<Double> {

    /// Create a tween between two `SIMD64<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD64<Double>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD64<Double>> {
        let data = travel.toTweenData(interpolator: simd64doubleTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
