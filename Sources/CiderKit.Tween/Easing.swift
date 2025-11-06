import Foundation

/// Easing types
///
/// Each easing type is associated with an easing function.
/// Easing functions specify the rate of change of a parameter over time.
///
/// Code of the easing functions of all types but ```custom(_:_:)``` come from the [easings.net](https://easings.net) website.
public enum Easing: CaseIterable, Sendable, Codable, CustomStringConvertible {

    /// All cases but ```custom(_:_:)```
    public static let allCases: [Easing] = [
        .inSine, .outSine, .inOutSine,
        .inCubic, .outCubic, .inOutCubic,
        .inQuint, .outQuint, .inOutQuint,
        .inCirc, .outCirc, .inOutCirc,
        .inElastic, .outElastic, .inOutElastic,
        .inQuad, .outQuad, .inOutQuad,
        .inQuart, .outQuart, .inOutQuart,
        .inExpo, .outExpo, .inOutExpo,
        .inBack, .outBack, .inOutBack,
        .inBounce, .outBounce, .inOutBounce,
        .linear
    ]

    /// Implementation details on [easings.net](https://easings.net/#easeInSine)
    ///
    /// > Note: ```description``` will return `"In Sine"` for this case.
    case inSine
    /// Implementation details on [easings.net](https://easings.net/#easeOutSine)
    ///
    /// > Note: ```description``` will return `"Out Sine"` for this case.
    case outSine
    /// Implementation details on [easings.net](https://easings.net/#easeInOutSine)
    ///
    /// > Note: ```description``` will return `"In Out Sine"` for this case.
    case inOutSine

    /// Implementation details on [easings.net](https://easings.net/#easeInCubic)
    ///
    /// > Note: ```description``` will return `"In Cubic"` for this case.
    case inCubic
    /// Implementation details on [easings.net](https://easings.net/#easeOutCubic)
    ///
    /// > Note: ```description``` will return `"Out Cubic"` for this case.
    case outCubic
    /// Implementation details on [easings.net](https://easings.net/#easeInOutCubic)
    ///
    /// > Note: ```description``` will return `"In Out Cubic"` for this case.
    case inOutCubic

    /// Implementation details on [easings.net](https://easings.net/#easeInQuint)
    ///
    /// > Note: ```description``` will return `"In Quint"` for this case.
    case inQuint
    /// Implementation details on [easings.net](https://easings.net/#easeOutQuint)
    ///
    /// > Note: ```description``` will return `"Out Quint"` for this case.
    case outQuint
    /// Implementation details on [easings.net](https://easings.net/#easeInOutQuint)
    ///
    /// > Note: ```description``` will return `"In Out Quint"` for this case.
    case inOutQuint

    /// Implementation details on [easings.net](https://easings.net/#easeInCirc)
    ///
    /// > Note: ```description``` will return `"In Circ"` for this case.
    case inCirc
    /// Implementation details on [easings.net](https://easings.net/#easeOutCirc)
    ///
    /// > Note: ```description``` will return `"Out Circ"` for this case.
    case outCirc
    /// Implementation details on [easings.net](https://easings.net/#easeInOutCirc)
    ///
    /// > Note: ```description``` will return `"In Out Circ"` for this case.
    case inOutCirc

    /// Implementation details on [easings.net](https://easings.net/#easeInElastic)
    ///
    /// > Note: ```description``` will return `"In Elastic"` for this case.
    case inElastic
    /// Implementation details on [easings.net](https://easings.net/#easeOutElastic)
    ///
    /// > Note: ```description``` will return `"Out Elastic"` for this case.
    case outElastic
    /// Implementation details on [easings.net](https://easings.net/#easeInOutElastic)
    ///
    /// > Note: ```description``` will return `"In Out Elastic"` for this case.
    case inOutElastic

    /// Implementation details on [easings.net](https://easings.net/#easeInQuad)
    ///
    /// > Note: ```description``` will return `"In Quad"` for this case.
    case inQuad
    /// Implementation details on [easings.net](https://easings.net/#easeOutQuad)
    ///
    /// > Note: ```description``` will return `"Out Quad"` for this case.
    case outQuad
    /// Implementation details on [easings.net](https://easings.net/#easeInOutQuad)
    ///
    /// > Note: ```description``` will return `"In Out Quad"` for this case.
    case inOutQuad

    /// Implementation details on [easings.net](https://easings.net/#easeInQuart)
    ///
    /// > Note: ```description``` will return `"In Quart"` for this case.
    case inQuart
    /// Implementation details on [easings.net](https://easings.net/#easeOutQuart)
    ///
    /// > Note: ```description``` will return `"Out Quart"` for this case.
    case outQuart
    /// Implementation details on [easings.net](https://easings.net/#easeInOutQuart)
    ///
    /// > Note: ```description``` will return `"In Out Quart"` for this case.
    case inOutQuart

    /// Implementation details on [easings.net](https://easings.net/#easeInExpo)
    ///
    /// > Note: ```description``` will return `"In Expo"` for this case.
    case inExpo
    /// Implementation details on [easings.net](https://easings.net/#easeOutExpo)
    ///
    /// > Note: ```description``` will return `"Out Expo"` for this case.
    case outExpo
    /// Implementation details on [easings.net](https://easings.net/#easeInOutExpo)
    ///
    /// > Note: ```description``` will return `"In Out Expo"` for this case.
    case inOutExpo

    /// Implementation details on [easings.net](https://easings.net/#easeInBack)
    ///
    /// > Note: ```description``` will return `"In Back"` for this case.
    case inBack
    /// Implementation details on [easings.net](https://easings.net/#easeOutBack)
    ///
    /// > Note: ```description``` will return `"Out Back"` for this case.
    case outBack
    /// Implementation details on [easings.net](https://easings.net/#easeInOutBack)
    ///
    /// > Note: ```description``` will return `"In Out Back"` for this case.
    case inOutBack

    /// Implementation details on [easings.net](https://easings.net/#easeInBounce)
    ///
    /// > Note: ```description``` will return `"In Bounce"` for this case.
    case inBounce
    /// Implementation details on [easings.net](https://easings.net/#easeOutBounce)
    ///
    /// > Note: ```description``` will return `"Out Bounce"` for this case.
    case outBounce
    /// Implementation details on [easings.net](https://easings.net/#easeInOutBounce)
    ///
    /// > Note: ```description``` will return `"In Out Bounce"` for this case.
    case inOutBounce

    /// Implementation details on [easings.net](https://easings.net/#easeLinear)
    ///
    /// > Note: ```description``` will return `"Linear"` for this case.
    case linear

    /// Allows the use of a custom easing
    ///
    /// > Warning: This case cannot be encoded and will throw ```EasingError/encodingCustom```
    ///
    /// - Parameters:
    ///     - easingFunction: Custom ```EasingFunction``` to apply
    ///     - description: Textual description of the applied esaing type
    case custom(_ easingFunction: EasingFunction, _ description: String = "Custom")

    /// Creates an easing compatible with the CSS `steps()` function
    ///
    /// See [this page](https://developer.mozilla.org/en-US/docs/Web/CSS/easing-function/steps) for more information
    ///
    /// - Parameters:
    ///     - stepCount: Number of steps
    ///     - jumpType: Specifies when the jump between values occurs
    public static func steps(_ stepCount: UInt, jumpType: StepJumpType) throws -> Easing {
        return .custom(try EasingFunctions.steps(stepCount, jumpType: jumpType), "steps(\(stepCount), \(jumpType))")
    }

    /// Creates an easing compatible with the CSS `cubic-bezier()` function
    ///
    /// See [this page](https://developer.mozilla.org/en-US/docs/Web/CSS/easing-function/cubic-bezier) for more information
    ///
    /// - Parameters:
    ///     - c1: First control point
    ///     - c2: Second control point
    public static func cubicBezier(c1: CGPoint, c2: CGPoint) -> Easing {
        return .custom(EasingFunctions.cubicBezier(c1: c1, c2: c2), "cubic-bezier(\(c1.x), \(c1.y), \(c2.x), \(c2.y))")
    }

    /// Decodes an easing case from its ```description```
    ///
    /// For example, `"In Sine"` will be decoded as ```inSine```
    ///
    /// > Note: It is not possible to decode ```custom(_:_:)``` as it cannot be encoded in the first place
    ///
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: ```EasingError/unknownEncodedEasing``` if trying to decode an unsupported type, including ```custom(_:_:)```
    public init(from decoder: any Decoder) throws {
        let singleValueContainer = try decoder.singleValueContainer()
        let easingDescription = try singleValueContainer.decode(String.self)
        guard let easing = descriptionToEasingMap[easingDescription] else {
            throw EasingError.unknownEncodedEasing
        }
        self = easing
    }

    /// Encodes an easing case according to its ```description```
    ///
    /// For example, ```inSine``` with be encoded as `"In Sine"`.
    ///
    /// - Parameter encoder: The encoder to write data to.
    /// - Throws:```EasingError/encodingCustom``` if trying to encode ```custom(_:_:)```
    public func encode(to encoder: any Encoder) throws {
        if case .custom = self {
            throw EasingError.encodingCustom
        }

        var singleValueContainer = encoder.singleValueContainer()
        try singleValueContainer.encode(description)
    }

    /// Textual representation of the easing enumeration
    public var description: String {
        switch self {
            case .inSine: return "In Sine"
            case .outSine: return "Out Sine"
            case .inOutSine: return "In Out Sine"

            case .inCubic: return "In Cubic"
            case .outCubic: return "Out Cubic"
            case .inOutCubic: return "In Out Cubic"

            case .inQuint: return "In Quint"
            case .outQuint: return "Out Quint"
            case .inOutQuint: return "In Out Quint"

            case .inCirc: return "In Circ"
            case .outCirc: return "Out Circ"
            case .inOutCirc: return "In Out Circ"

            case .inElastic: return "In Elastic"
            case .outElastic: return "Out Elastic"
            case .inOutElastic: return "In Out Elastic"

            case .inQuad: return "In Quad"
            case .outQuad: return "Out Quad"
            case .inOutQuad: return "In Out Quad"

            case .inQuart: return "In Quart"
            case .outQuart: return "Out Quart"
            case .inOutQuart: return "In Out Quart"

            case .inExpo: return "In Expo"
            case .outExpo: return "Out Expo"
            case .inOutExpo: return "In Out Expo"

            case .inBack: return "In Back"
            case .outBack: return "Out Back"
            case .inOutBack: return "In Out Back"

            case .inBounce: return "In Bounce"
            case .outBounce: return "Out Bounce"
            case .inOutBounce: return "In Out Bounce"

            case .linear: return "Linear"
            case .custom(_, let description): return description
        }
    }

    /// Easing function associated with the easing enumeration
    public func easingFunction() -> EasingFunction {
        switch self {
            case .inSine: EasingFunctions.inSine
            case .outSine: EasingFunctions.outSine
            case .inOutSine: EasingFunctions.inOutSine

            case .inCubic: EasingFunctions.inCubic
            case .outCubic: EasingFunctions.outCubic
            case .inOutCubic: EasingFunctions.inOutCubic

            case .inQuint: EasingFunctions.inQuint
            case .outQuint: EasingFunctions.outQuint
            case .inOutQuint: EasingFunctions.inOutQuint

            case .inCirc: EasingFunctions.inCirc
            case .outCirc: EasingFunctions.outCirc
            case .inOutCirc: EasingFunctions.inOutCirc

            case .inElastic: EasingFunctions.inElastic
            case .outElastic: EasingFunctions.outElastic
            case .inOutElastic: EasingFunctions.inOutElastic

            case .inQuad: EasingFunctions.inQuad
            case .outQuad: EasingFunctions.outQuad
            case .inOutQuad: EasingFunctions.inOutQuad

            case .inQuart: EasingFunctions.inQuart
            case .outQuart: EasingFunctions.outQuart
            case .inOutQuart: EasingFunctions.inOutQuart

            case .inExpo: EasingFunctions.inExpo
            case .outExpo: EasingFunctions.outExpo
            case .inOutExpo: EasingFunctions.inOutExpo

            case .inBack: EasingFunctions.inBack
            case .outBack: EasingFunctions.outBack
            case .inOutBack: EasingFunctions.inOutBack

            case .inBounce: EasingFunctions.inBounce
            case .outBounce: EasingFunctions.outBounce
            case .inOutBounce: EasingFunctions.inOutBounce

            case .custom(let easingFunction, _): easingFunction
            default: EasingFunctions.linear
        }
    }

}

private let descriptionToEasingMap: [String: Easing] = [
    "In Sine": .inSine,
    "Out Sine": .outSine,
    "In Out Sine": .inOutSine,

    "In Cubic": .inCubic,
    "Out Cubic": .outCubic,
    "In Out Cubic": .inOutCubic,

    "In Quint": .inQuint,
    "Out Quint": .outQuint,
    "In Out Quint": .inOutQuint,

    "In Circ": .inCirc,
    "Out Circ": .outCirc,
    "In Out Circ": .inOutCirc,

    "In Elastic": .inElastic,
    "Out Elastic": .outElastic,
    "In Out Elastic": .inOutElastic,

    "In Quad": .inQuad,
    "Out Quad": .outQuad,
    "In Out Quad": .inOutQuad,

    "In Quart": .inQuart,
    "Out Quart": .outQuart,
    "In Out Quart": .inOutQuart,

    "In Expo": .inExpo,
    "Out Expo": .outExpo,
    "In Out Expo": .inOutExpo,

    "In Back": .inBack,
    "Out Back": .outBack,
    "In Out Back": .inOutBack,

    "In Bounce": .inBounce,
    "Out Bounce": .outBounce,
    "In Out Bounce": .inOutBounce,

    "Linear": .linear
]
