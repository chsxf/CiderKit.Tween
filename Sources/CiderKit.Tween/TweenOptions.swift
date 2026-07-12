import Foundation

/// Represents the common options for tweens
public struct TweenOptions: Sendable {

    /// Duration in seconds of the tween
    public let duration: TimeInterval
    /// Easing type
    public let easing: Easing
    /// Defines how the tween loops
    public let loopingType: LoopingType
    /// Manual update flag
    ///
    /// If set, the tween won't be animated automatically and you will be resposible for calling ```Tween/update(additionalElapsedTime:)```
    public let manualUpdate: Bool

    /// Initializer
    ///
    /// - Parameters:
    ///     - duration: Duration in seconds of the tween
    ///     - easing: Easing type (defaults to ```Easing/linear```
    ///     - loopingType: Defines how the tween loops. Defaults to ```LoopingType/none```
    ///     - manualUpdate: If set, the tween won't be animated automatically and you will be resposible for calling ```Tween/update(additionalElapsedTime:)```
    public init(duration: TimeInterval, easing: Easing = .linear, loopingType: LoopingType = .none, manualUpdate: Bool = false) {
        self.duration = duration
        self.easing = easing
        self.loopingType = loopingType
        self.manualUpdate = manualUpdate
    }

}
