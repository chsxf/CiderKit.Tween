import Foundation

internal func uintTweenInterpolator(from: UInt, to: UInt, easedValue: Float) -> UInt {
    let doubleFrom = Double(from)
    let doubleTo = Double(to)

    let result = doubleFrom + (doubleTo - doubleFrom) * Double(easedValue)
    return UInt(result.rounded(.towardZero))
}

/// Tween-specific extensions
public extension UInt {

    /// Create a tween between two `UInt` values
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<UInt> {
        let data = travel.toTweenData(interpolator: uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd2uintTweenInterpolator(from: SIMD2<UInt>, to: SIMD2<UInt>, easedValue: Float) -> SIMD2<UInt> {
    let simdDoubleFrom = SIMD2<Double>(from)
    let simdDoubleTo = SIMD2<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD2<UInt>()
    for i in 0..<2 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD2<UInt> {

    /// Create a tween between two `SIMD2<UInt>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD2<UInt>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD2<UInt>> {
        let data = travel.toTweenData(interpolator: simd2uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd3uintTweenInterpolator(from: SIMD3<UInt>, to: SIMD3<UInt>, easedValue: Float) -> SIMD3<UInt> {
    let simdDoubleFrom = SIMD3<Double>(from)
    let simdDoubleTo = SIMD3<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD3<UInt>()
    for i in 0..<3 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD3<UInt> {

    /// Create a tween between two `SIMD3<UInt>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD3<UInt>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD3<UInt>> {
        let data = travel.toTweenData(interpolator: simd3uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd4uintTweenInterpolator(from: SIMD4<UInt>, to: SIMD4<UInt>, easedValue: Float) -> SIMD4<UInt> {
    let simdDoubleFrom = SIMD4<Double>(from)
    let simdDoubleTo = SIMD4<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD4<UInt>()
    for i in 0..<4 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD4<UInt> {

    /// Create a tween between two `SIMD4<UInt>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD4<UInt>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD4<UInt>> {
        let data = travel.toTweenData(interpolator: simd4uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd8uintTweenInterpolator(from: SIMD8<UInt>, to: SIMD8<UInt>, easedValue: Float) -> SIMD8<UInt> {
    let simdDoubleFrom = SIMD8<Double>(from)
    let simdDoubleTo = SIMD8<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD8<UInt>()
    for i in 0..<8 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD8<UInt> {

    /// Create a tween between two `SIMD8<UInt>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD8<UInt>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD8<UInt>> {
        let data = travel.toTweenData(interpolator: simd8uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd16uintTweenInterpolator(from: SIMD16<UInt>, to: SIMD16<UInt>, easedValue: Float) -> SIMD16<UInt> {
    let simdDoubleFrom = SIMD16<Double>(from)
    let simdDoubleTo = SIMD16<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD16<UInt>()
    for i in 0..<16 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD16<UInt> {

    /// Create a tween between two `SIMD16<UInt>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD16<UInt>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD16<UInt>> {
        let data = travel.toTweenData(interpolator: simd16uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd32uintTweenInterpolator(from: SIMD32<UInt>, to: SIMD32<UInt>, easedValue: Float) -> SIMD32<UInt> {
    let simdDoubleFrom = SIMD32<Double>(from)
    let simdDoubleTo = SIMD32<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD32<UInt>()
    for i in 0..<32 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD32<UInt> {

    /// Create a tween between two `SIMD32<UInt>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD32<UInt>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD32<UInt>> {
        let data = travel.toTweenData(interpolator: simd32uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}

internal func simd64uintTweenInterpolator(from: SIMD64<UInt>, to: SIMD64<UInt>, easedValue: Float) -> SIMD64<UInt> {
    let simdDoubleFrom = SIMD64<Double>(from)
    let simdDoubleTo = SIMD64<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD64<UInt>()
    for i in 0..<64 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD64<UInt> {

    /// Create a tween between two `SIMD64<UInt>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(_ travel: TweenDetailedTravel<SIMD64<UInt>>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD64<UInt>> {
        let data = travel.toTweenData(interpolator: simd64uintTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}
