import Foundation

/// Represents an ensemble of ```Tween``` and/or ```Sequence``` instances being sequenced and players together
///
/// With sequences, you can play multiple ```Tween``` or ```Sequence``` instances one after another, or over the same period of time,
/// while keeping references to a single object.
///
/// Sequences differ from ```Tween``` in a variety of ways:
/// - In their current implementation, they cannot loop
/// - They are type-agnostic, so there is no stream of update values available
/// - Their duration is defined by their content
public actor Sequence {

    internal private(set) var entries = [SequenceEntry]() {
        didSet {
            computeTotalDuration()
        }
    }

    internal private(set) var totalDuration: TimeInterval
    internal let manualUpdate: Bool

    private let onStartContinuation: AsyncStream<Void>.Continuation
    /// This `AsyncStream` will produce one `Void` value when the sequence starts
    ///
    /// > Warning: You have to await for this `AsyncStream` values before the sequence has started to receive values
    public let onStart: AsyncStream<Void>

    private let onCompletionContinuation: AsyncStream<Void>.Continuation
    /// This `AsyncStream` will produce one `Void` value when the sequence completes
    public let onCompletion: AsyncStream<Void>

    internal private(set) var elapsedTime: TimeInterval = 0
    private var startHasBeenNotified: Bool = false
    private var isRunning = true
    internal private(set) var isComplete = false

    /// Initializes a new `Sequence` instance
    /// - Parameter manualUpdate: If set, the sequence won't be animated automatically and you will be resposible for calling ```update(additionalElapsedTime:)```
    public init(manualUpdate: Bool = false) async {
        self.manualUpdate = manualUpdate
        totalDuration = 0
        (onStart, onStartContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))
        (onCompletion, onCompletionContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))

        if !manualUpdate {
            await TweenManager.shared.register(sequence: self)
        }
    }

    private func computeTotalDuration() {
        totalDuration = 0
        for entry in entries {
            let entryEndTime = entry.startAt + entry.duration
            if entryEndTime > totalDuration {
                totalDuration = entryEndTime
            }
        }
    }

    /// Insert a ```Tween``` instance at the specific timestamp in the sequence
    /// - Parameters:
    ///     - at: timestamp at which insert the ```Tween``` instance
    ///     - tween: ```Tween``` instance to insert
    public func insert<T: Sendable>(at: TimeInterval, tween: Tween<T>) async throws {
        guard !startHasBeenNotified else { throw SequenceError.modificationAfterStart }
        if !tween.instance.manualUpdate {
            await TweenManager.shared.unregister(tweenInstance: tween.instance)
        }
        entries.append(await SequenceEntry(startAt: at, tweenInstance: tween.instance))
    }

    /// Insert a ```Sequence``` instance at the specific timestamp in the sequence
    /// - Parameters:
    ///     - at: timestamp at which insert the ```Sequence``` instance
    ///     - sequence: ```Sequence``` instance to insert
    public func insert(at: TimeInterval, sequence: Sequence) async throws {
        guard !startHasBeenNotified else { throw SequenceError.modificationAfterStart }
        if !sequence.manualUpdate {
            await TweenManager.shared.unregister(sequence: sequence)
        }
        entries.append(await SequenceEntry(startAt: at, sequence: sequence))
    }

    /// Appends a ```Tween``` instance at the end of the sequence
    ///
    /// > Note: Calling this function is the same as calling ```insert(at:tween:)```
    /// > with the timestamp set to the duration of the sequence
    ///
    /// - Parameter tween: ```Tween``` instance to append
    public func append<T: Sendable>(tween: Tween<T>) async throws {
        try await insert(at: totalDuration, tween: tween)
    }

    /// Appends a ```Sequence``` instance at the end of the sequence
    ///
    /// > Note: Calling this function is the same as calling ```insert(at:sequence:)```
    /// > with the timestamp set to the duration of the sequence
    ///
    /// - Parameter sequence: ```Sequence``` instance to append
    public func append(sequence: Sequence) async throws {
        try await insert(at: totalDuration, sequence: sequence)
    }

    /// Progress the sequence by a certain amount of time in seconds
    ///
    /// > Note: You should only call this function if the sequence is not updated automatically by the ```TweenManager```
    ///
    /// - Parameter additionalElapsedTime: Amount of time in seconds of sequence progress
    public func update(additionalElapsedTime: TimeInterval) async {
        guard isRunning && !isComplete && additionalElapsedTime > 0 && !entries.isEmpty else {
            return
        }

        if !startHasBeenNotified {
            onStartContinuation.yield()
            onStartContinuation.finish()
            startHasBeenNotified = true
        }

        let previousElapsedTime = elapsedTime
        let applicableAdditionalElapsedTime: TimeInterval
        var shouldComplete = false
        if totalDuration > 0 {
            let remainingTime = totalDuration - elapsedTime
            if remainingTime <= additionalElapsedTime {
                applicableAdditionalElapsedTime = remainingTime
                shouldComplete = true
            }
            else {
                applicableAdditionalElapsedTime = additionalElapsedTime
            }
            elapsedTime += applicableAdditionalElapsedTime
        }
        else {
            applicableAdditionalElapsedTime = additionalElapsedTime
        }

        for entry in entries where entry.startAt <= elapsedTime {
            let diffStart = previousElapsedTime <= entry.startAt ? entry.startAt : previousElapsedTime
            let elapsedTimeForSequence = min(applicableAdditionalElapsedTime, elapsedTime - diffStart)
            await entry.update(additionalElapsedTime: elapsedTimeForSequence)
        }

        if shouldComplete {
            await stop(complete: true)
        }
    }

    /// Stops the sequence
    ///
    /// - Parameter complete: if set, the sequence will progress to its duration value before stopping
    public func stop(complete: Bool) async {
        if complete {
            if totalDuration > 0 {
                let remainingElapsedTime = totalDuration - elapsedTime
                await update(additionalElapsedTime: remainingElapsedTime)
            }
            isComplete = true
        }

        isRunning = false

        for entry in entries {
            await entry.stop()
        }

        if complete {
            onCompletionContinuation.yield()
        }
        onCompletionContinuation.finish()

        if !manualUpdate {
            await TweenManager.shared.unregister(sequence: self)
        }
    }

    /// Awaitable function that returns when the sequence is complete
    /// - Returns: `true` if the sequence actually completes, or `false` either
    @discardableResult
    public func waitForCompletion() async -> Bool {
        var completed = false
        for await _ in onCompletion {
            completed = true
        }
        return completed
    }

}
