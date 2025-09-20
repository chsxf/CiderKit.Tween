import Foundation

/// Represents data and transformation method for a ```Tween```
public struct TweenData<T: Sendable>: Sendable {

    /// Function that describes the interpolation method
    ///
    /// > Warning: It is not mandatory for `easedValue` to be contained between 0 and 1.
    /// > It is your responsibility to check for these boundaries if your interpolation function requires a clamped value.
    ///
    /// - Parameters:
    ///     - from: Start value of the tween
    ///     - to: End value of the tween
    ///     - easedValue: Value that has been transformed by an ```EasingFunction``` and that indicates the amount of interpolation that needs to be done
    /// - Returns: The interpolated tweened value
    public typealias InterpolatorFunction = @Sendable (_ from: T, _ to: T, _ easedValue: Float) -> T

    /// Function that recovers a start value at a later time
    /// - Returns: The start value to use when the tween starts
    public typealias DeferredValueAccessor = @Sendable () async -> T
    
    /// Function that computes the end value relatively from the start value
    /// - Parameters:
    ///     - from: Start value of the tween
    /// - Returns: The end value for the tween
    public typealias RelativeValueAccessor = @Sendable (_ from: T) -> T
    
    internal var from: T {
        get async { await deferredFrom() }
    }
    internal let deferredFrom: DeferredValueAccessor
    internal let to: RelativeValueAccessor
    internal let interpolator: InterpolatorFunction

    private let onStartContinuation: AsyncStream<Void>.Continuation
    /// This `AsyncStream` will produce one `Void` value when the tween starts
    ///
    /// > Warning: You have to await for this `AsyncStream` values before the tween has started to receive values
    public let onStart: AsyncStream<Void>

    private let onUpdateContinuation: AsyncStream<T>.Continuation
    /// This `AsyncStream` will produce one value every time the tween progresses
    public let onUpdate: AsyncStream<T>

    private let onLoopCompletionContinuation: AsyncStream<UInt>.Continuation
    /// This `AsyncStream` will procude one value every time a loop completes. No value is produced if the tween doesn't loop.
    public let onLoopCompletion: AsyncStream<UInt>

    private let onCompletionContinuation: AsyncStream<Void>.Continuation
    /// This `AsyncStream` will produce one `Void` value when the tween completes
    public let onCompletion: AsyncStream<Void>

    /// Initializer
    ///
    /// - Parameters:
    ///     - from: Start value
    ///     - to: End value
    ///     - interpolator: Function that will compute the interpolation
    public init(from: T, to: T, interpolator: @escaping InterpolatorFunction) {
        self.init(deferredFrom: { from }, to: to, interpolator: interpolator)
    }
    
    /// Initializer
    ///
    /// - Parameters:
    ///     - deferredFrom: Function called when the tween actually starts to recover the start value
    ///     - to: End value
    ///     - interpolator: Function that will compute the interpolation
    public init(deferredFrom: @escaping DeferredValueAccessor, to: T, interpolator: @escaping InterpolatorFunction) {
        self.init(deferredFrom: deferredFrom, to: { _ in to }, interpolator: interpolator)
    }
    
    /// Initializer
    ///
    /// - Parameters:
    ///     - deferredFrom: Function called when the tween actually starts to recover the start value
    ///     - to: Function that computes the end value based on the start value
    ///     - interpolator: Function that will compute the interpolation
    public init(deferredFrom: @escaping DeferredValueAccessor, to: @escaping RelativeValueAccessor, interpolator: @escaping InterpolatorFunction) {
        self.deferredFrom = deferredFrom
        self.to = to
        self.interpolator = interpolator

        (onStart, onStartContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))
        (onUpdate, onUpdateContinuation) = AsyncStream<T>.makeStream(bufferingPolicy: .bufferingNewest(0))
        (onLoopCompletion, onLoopCompletionContinuation) = AsyncStream<UInt>.makeStream(bufferingPolicy: .bufferingNewest(0))
        (onCompletion, onCompletionContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))
    }

    internal func notifyStart() {
        onStartContinuation.yield()
        onStartContinuation.finish()
    }

    internal func apply(from: T, easedValue: Float) {
        let current = interpolator(from, to(from), easedValue)
        onUpdateContinuation.yield(current)
    }

    internal func notifyLoopCompletion(loopNumber: UInt) {
        onLoopCompletionContinuation.yield(loopNumber)
    }

    internal func finish(complete: Bool) {
        if complete {
            onCompletionContinuation.yield()
        }

        onUpdateContinuation.finish()
        onLoopCompletionContinuation.finish()
        onCompletionContinuation.finish()
    }

}
