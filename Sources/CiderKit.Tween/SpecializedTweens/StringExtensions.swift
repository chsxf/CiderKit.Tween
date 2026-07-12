import Foundation

private let defaultScrambleCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

private func parametrizedStringTweenInterpolator(scrambled: Bool, scrambleCharacters: String?) -> TweenData<String>.InterpolatorFunction {
    let sc = scrambleCharacters ?? defaultScrambleCharacters
    return { from, to, easedValue in
        let toLength = to.count
        let revealedStringLength = intTweenInterpolator(from: 0, to: toLength, easedValue: easedValue)

        let fromLength = scrambled ? max(from.count, to.count) : from.count
        let toStart = to.startIndex
        if fromLength <= revealedStringLength {
            return String(to[..<to.index(toStart, offsetBy: revealedStringLength)])
        }

        let generatedStringLength = intTweenInterpolator(from: fromLength, to: toLength, easedValue: easedValue)
        let revealed = to[..<to.index(toStart, offsetBy: revealedStringLength)]

        if scrambled {
            let scrambledLength = generatedStringLength - revealedStringLength
            let scrambledPart = String((0..<scrambledLength).map { _ in sc.randomElement()! })
            return String(revealed) + scrambledPart
        }
        else {
            let fromStart = from.startIndex
            let complement = from[from.index(fromStart, offsetBy: revealedStringLength)..<from.index(fromStart, offsetBy: generatedStringLength)]
            return String(revealed + complement)
        }
    }
}

public extension String {

    /// Create a tween between two `String` values
    ///
    /// Characters from the end value are revealed progressively and the tween progresses.
    ///
    /// Produced values are created differently if the starting value has a greater length than the end value, whose overall length will
    /// progressively decrease to reach the length of the end value.
    ///
    /// Produced values can on demand also contain scrambled characters. In this case, the length of the generated values is the same
    /// as the current generated value or the end value, whichever is larger.
    ///
    /// > Tip: The following example will produce: `a`, `ab`, and `abc`
    /// >
    /// > ```swift
    /// > String.tween(from: "", to: "abc", duration: someDuration)
    /// > ```
    ///
    /// > Tip: The following example will produce: `abc`, `ab`, and `a`
    /// >
    /// > ```swift
    /// > String.tween(from: "abc", to: "", duration: someDuration)
    /// > ```
    ///
    /// > Tip: The following example will produce: `a##`, `ab#`, and `abc`. (`#` stands for any of the default scramble characters)
    /// >
    /// > ```swift
    /// > String.tween(from: "", to: "abc", duration: someDuration, scramble: true)
    /// > ```
    ///
    /// > Tip: The following example will produce: `a----`, `ab--`, and `abc`
    /// >
    /// > ```swift
    /// > String.tween(from: "     ", to: "abc", duration: someDuration, scramble: true, scrambleCharacters: "-")
    /// > ```
    ///
    /// - Parameters:
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - scramble: If set, unrevealed characters will be replaced by random characters
    ///     - scrambleCharacters: Pool of characters to use as scramble replacement. If `nil`, a pool containing lower-case and upper-case letters, and digits is used
    static func tween(_ travel: TweenDetailedTravel<String>, options: TweenOptions, scramble: Bool = false, scrambleCharacters: String? = nil) async -> Tween<String> {
        let interpolator = parametrizedStringTweenInterpolator(scrambled: scramble, scrambleCharacters: scrambleCharacters)
        let tweenData = travel.toTweenData(interpolator: interpolator)
        return await Tween(data: tweenData, options: options)
    }

}
