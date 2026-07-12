import Foundation

internal func intTweenInterpolator(from: Int, to: Int, easedValue: Float) -> Int {
    let doubleFrom = Double(from)
    let doubleTo = Double(to)

    let result = doubleFrom + (doubleTo - doubleFrom) * Double(easedValue)
    return Int(result.rounded(.towardZero))
}

/// Tween-specific extensions
public extension Int {

    /// Create a tween between two `Int` values
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<Int>, options: TweenOptions) async -> Tween<Int> {
        let data = travel.toTweenData(interpolator: intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd2intTweenInterpolator(from: SIMD2<Int>, to: SIMD2<Int>, easedValue: Float) -> SIMD2<Int> {
    let simdDoubleFrom = SIMD2<Double>(from)
    let simdDoubleTo = SIMD2<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD2<Int>()
    for i in 0..<2 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD2<Int> {

    /// Create a tween between two `SIMD2<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD2<Int>>, options: TweenOptions) async -> Tween<SIMD2<Int>> {
        let data = travel.toTweenData(interpolator: simd2intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd3intTweenInterpolator(from: SIMD3<Int>, to: SIMD3<Int>, easedValue: Float) -> SIMD3<Int> {
    let simdDoubleFrom = SIMD3<Double>(from)
    let simdDoubleTo = SIMD3<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD3<Int>()
    for i in 0..<3 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD3<Int> {

    /// Create a tween between two `SIMD3<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD3<Int>>, options: TweenOptions) async -> Tween<SIMD3<Int>> {
        let data = travel.toTweenData(interpolator: simd3intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd4intTweenInterpolator(from: SIMD4<Int>, to: SIMD4<Int>, easedValue: Float) -> SIMD4<Int> {
    let simdDoubleFrom = SIMD4<Double>(from)
    let simdDoubleTo = SIMD4<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD4<Int>()
    for i in 0..<4 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD4<Int> {

    /// Create a tween between two `SIMD4<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD4<Int>>, options: TweenOptions) async -> Tween<SIMD4<Int>> {
        let data = travel.toTweenData(interpolator: simd4intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd8intTweenInterpolator(from: SIMD8<Int>, to: SIMD8<Int>, easedValue: Float) -> SIMD8<Int> {
    let simdDoubleFrom = SIMD8<Double>(from)
    let simdDoubleTo = SIMD8<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD8<Int>()
    for i in 0..<8 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD8<Int> {

    /// Create a tween between two `SIMD8<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD8<Int>>, options: TweenOptions) async -> Tween<SIMD8<Int>> {
        let data = travel.toTweenData(interpolator: simd8intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd16intTweenInterpolator(from: SIMD16<Int>, to: SIMD16<Int>, easedValue: Float) -> SIMD16<Int> {
    let simdDoubleFrom = SIMD16<Double>(from)
    let simdDoubleTo = SIMD16<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD16<Int>()
    for i in 0..<16 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD16<Int> {

    /// Create a tween between two `SIMD16<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD16<Int>>, options: TweenOptions) async -> Tween<SIMD16<Int>> {
        let data = travel.toTweenData(interpolator: simd16intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd32intTweenInterpolator(from: SIMD32<Int>, to: SIMD32<Int>, easedValue: Float) -> SIMD32<Int> {
    let simdDoubleFrom = SIMD32<Double>(from)
    let simdDoubleTo = SIMD32<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD32<Int>()
    for i in 0..<32 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD32<Int> {

    /// Create a tween between two `SIMD32<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD32<Int>>, options: TweenOptions) async -> Tween<SIMD32<Int>> {
        let data = travel.toTweenData(interpolator: simd32intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd64intTweenInterpolator(from: SIMD64<Int>, to: SIMD64<Int>, easedValue: Float) -> SIMD64<Int> {
    let simdDoubleFrom = SIMD64<Double>(from)
    let simdDoubleTo = SIMD64<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD64<Int>()
    for i in 0..<64 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD64<Int> {

    /// Create a tween between two `SIMD64<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD64<Int>>, options: TweenOptions) async -> Tween<SIMD64<Int>> {
        let data = travel.toTweenData(interpolator: simd64intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}
