import Foundation

/// Represents a tween and is the main point of interaction with it
public struct Tween<T: Sendable>: Sendable {

    internal let instance: TweenInstanceActor<T>
    internal let data: TweenData<T>

    /// Access to the tween options passed during initialization
    public let options: TweenOptions

    /// Indicates if the tween is running or not. The ```isComplete``` is `true`, this is always `false`
    public var isRunning: Bool { get async { await instance.isRunning } }
    /// Indicates if the tween has completed or not
    public var isComplete: Bool { get async { await instance.isComplete } }
    /// Indicates how many times has elapsed during the tween. For looping tweens, this indicates the elapsed time inside a loop and not the overall elapsed time.
    public var elpasedTime: TimeInterval { get async { await instance.elapsedTime } }

    /// Retrieves an `AsyncStream` that will produce one `Void` value when the tween starts
    ///
    /// > Warning: You have to await for this `AsyncStream` values before the tween has started to receive values
    public var onStart: AsyncStream<Void> { get async { await instance.makeStartStream() } }

    /// Retrieves an `AsyncStream` that will produce one value every time the tween progresses
    public var onUpdate: AsyncStream<T> { get async { await instance.makeUpdateStream() } }

    /// Retrieves an `AsyncStream` that will procude one value every time a loop completes. No value is produced if the tween doesn't loop.
    public var onLoopCompletion: AsyncStream<UInt> { get async { await instance.makeLoopCompletionStream() } }

    /// Retrieves an `AsyncStream` that will produce one `Void` value when the tween completes
    public var onCompletion: AsyncStream<Void> { get async { await instance.makeCompletionStream() } }

    /// Initializer
    ///
    /// - Parameters:
    ///     - data: Data for the tween (start and end values, and interpolation function)
    ///     - options: Options for this tween
    public init(data: TweenData<T>, options: TweenOptions) async {
        self.data = data
        self.options = options
        instance = await TweenInstanceActor(tweenData: data, options: options)
    }

    /// Progress the tween by a certain amount of time in seconds
    ///
    /// > Note: You should only call this function if the tween is not updated automatically by the ```TweenManager```
    ///
    /// - Parameter additionalElapsedTime: Amount of time in seconds of tween progress
    public func update(additionalElapsedTime: TimeInterval) async {
        await instance.update(additionalElapsedTime: additionalElapsedTime)
    }

    /// Stops the tween
    ///
    /// - Parameter complete: if set, the tween will reach its end value before stopping
    public func stop(complete: Bool = false) async {
        await instance.stop(complete: complete)
    }

    /// Awaitable function that returns when the tween is complete
    /// - Returns: `true` if the tween actually completes, or `false` either
    @discardableResult
    public func waitForCompletion() async -> Bool {
        var completed = false
        for await _ in await onCompletion {
            completed = true
        }
        return completed
    }

}
