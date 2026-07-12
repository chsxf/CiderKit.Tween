import Foundation

internal func floatTweenInterpolator(from: Float, to: Float, easedValue: Float) -> Float {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension Float {

    /// Create a tween between two `Float` values
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<Float>, options: TweenOptions) async -> Tween<Float> {
        let data = travel.toTweenData(interpolator: floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd2floatTweenInterpolator(from: SIMD2<Float>, to: SIMD2<Float>, easedValue: Float) -> SIMD2<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD2<Float> {

    /// Create a tween between two `SIMD2<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD2<Float>>, options: TweenOptions) async -> Tween<SIMD2<Float>> {
        let data = travel.toTweenData(interpolator: simd2floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd3floatTweenInterpolator(from: SIMD3<Float>, to: SIMD3<Float>, easedValue: Float) -> SIMD3<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD3<Float> {

    /// Create a tween between two `SIMD3<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD3<Float>>, options: TweenOptions) async -> Tween<SIMD3<Float>> {
        let data = travel.toTweenData(interpolator: simd3floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd4floatTweenInterpolator(from: SIMD4<Float>, to: SIMD4<Float>, easedValue: Float) -> SIMD4<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD4<Float> {

    /// Create a tween between two `SIMD4<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD4<Float>>, options: TweenOptions) async -> Tween<SIMD4<Float>> {
        let data = travel.toTweenData(interpolator: simd4floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd8floatTweenInterpolator(from: SIMD8<Float>, to: SIMD8<Float>, easedValue: Float) -> SIMD8<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD8<Float> {

    /// Create a tween between two `SIMD8<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD8<Float>>, options: TweenOptions) async -> Tween<SIMD8<Float>> {
        let data = travel.toTweenData(interpolator: simd8floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd16floatTweenInterpolator(from: SIMD16<Float>, to: SIMD16<Float>, easedValue: Float) -> SIMD16<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD16<Float> {

    /// Create a tween between two `SIMD16<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD16<Float>>, options: TweenOptions) async -> Tween<SIMD16<Float>> {
        let data = travel.toTweenData(interpolator: simd16floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd32floatTweenInterpolator(from: SIMD32<Float>, to: SIMD32<Float>, easedValue: Float) -> SIMD32<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD32<Float> {

    /// Create a tween between two `SIMD32<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD32<Float>>, options: TweenOptions) async -> Tween<SIMD32<Float>> {
        let data = travel.toTweenData(interpolator: simd32floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}

internal func simd64floatTweenInterpolator(from: SIMD64<Float>, to: SIMD64<Float>, easedValue: Float) -> SIMD64<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD64<Float> {

    /// Create a tween between two `SIMD64<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    static func tween(_ travel: TweenDetailedTravel<SIMD64<Float>>, options: TweenOptions) async -> Tween<SIMD64<Float>> {
        let data = travel.toTweenData(interpolator: simd64floatTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, options: options)
    }

}
