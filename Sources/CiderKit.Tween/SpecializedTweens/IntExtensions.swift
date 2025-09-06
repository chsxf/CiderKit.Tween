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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: Int, to: Int, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<Int> {
        let data = TweenData(from: from, to: to, interpolator: intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `Int` values, with the starting value being obtained when the tween actually starts
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<Int>.DeferredValueAccessor, to: Int, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<Int> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: SIMD2<Int>, to: SIMD2<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD2<Int>> {
        let data = TweenData(from: from, to: to, interpolator: simd2intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `SIMD2<Int>` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<SIMD2<Int>>.DeferredValueAccessor, to: SIMD2<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD2<Int>> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: simd2intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: SIMD3<Int>, to: SIMD3<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD3<Int>> {
        let data = TweenData(from: from, to: to, interpolator: simd3intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `SIMD3<Int>` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<SIMD3<Int>>.DeferredValueAccessor, to: SIMD3<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD3<Int>> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: simd3intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: SIMD4<Int>, to: SIMD4<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD4<Int>> {
        let data = TweenData(from: from, to: to, interpolator: simd4intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `SIMD4<Int>` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<SIMD4<Int>>.DeferredValueAccessor, to: SIMD4<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD4<Int>> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: simd4intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: SIMD8<Int>, to: SIMD8<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD8<Int>> {
        let data = TweenData(from: from, to: to, interpolator: simd8intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `SIMD8<Int>` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<SIMD8<Int>>.DeferredValueAccessor, to: SIMD8<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD8<Int>> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: simd8intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: SIMD16<Int>, to: SIMD16<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD16<Int>> {
        let data = TweenData(from: from, to: to, interpolator: simd16intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `SIMD16<Int>` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<SIMD16<Int>>.DeferredValueAccessor, to: SIMD16<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD16<Int>> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: simd16intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: SIMD32<Int>, to: SIMD32<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD32<Int>> {
        let data = TweenData(from: from, to: to, interpolator: simd32intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `SIMD32<Int>` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<SIMD32<Int>>.DeferredValueAccessor, to: SIMD32<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD32<Int>> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: simd32intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
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
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(from: SIMD64<Int>, to: SIMD64<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD64<Int>> {
        let data = TweenData(from: from, to: to, interpolator: simd64intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Create a tween between two `SIMD64<Int>` values, with the starting value being obtained when the tween actually starts
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - deferredFrom: Deferred starting value accessor
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    ///     - loopingType: Defines if and how the tween will loop. Defaults to `.none`
    static func tween(deferredFrom: @escaping TweenData<SIMD64<Int>>.DeferredValueAccessor, to: SIMD64<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async -> Tween<SIMD64<Int>> {
        let data = TweenData(deferredFrom: deferredFrom, to: to, interpolator: simd64intTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

}