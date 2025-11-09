import Foundation

/// Represents a tween and is the main point of interaction with it
///
/// > Note: This type has dynamic member lookup for ```TweenData```
@dynamicMemberLookup
public struct Tween<T: Sendable>: Sendable {

    internal let instance: TweenInstanceActor<T>
    internal let data: TweenData<T>

    /// Indicates if the tween is running or not. The ```isComplete``` is `true`, this is always `false`
    public var isRunning: Bool { get async { await instance.isRunning } }
    /// Indicates if the tween has completed or not
    public var isComplete: Bool { get async { await instance.isComplete } }
    /// Indicates how many times has elapsed during the tween. For looping tweens, this indicates the elapsed time inside a loop and not the overall elapsed time.
    public var elpasedTime: TimeInterval { get async { await instance.elapsedTime } }

    /// Initializer
    ///
    /// - Parameters:
    ///     - data: Data for the tween (start and end values, and interpolation function)
    ///     - duration: Duration in seconds of the tween
    ///     - easing: Easing type (defaults to ```Easing/linear```
    ///     - manualUpdate: If set, the tween won't be animated automatically and you will be resposible for calling ```update(additionalElapsedTime:)```
    ///     - loopingType: Defines how the tween loops. Defaults to `.none`
    public init(data: TweenData<T>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false, loopingType: LoopingType = .none) async {
        self.data = data
        instance = await TweenInstanceActor(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate, loopingType: loopingType)
    }

    /// Dymamic accessor for members of ```TweenData```.
    public subscript<Result>(dynamicMember member: KeyPath<TweenData<T>, Result>) -> Result {
        data[keyPath: member]
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
        for await _ in data.onCompletion {
            completed = true
        }
        return completed
    }

}
