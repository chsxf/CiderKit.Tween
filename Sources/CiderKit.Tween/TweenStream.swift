internal struct TweenStream<T: Sendable> {

    public let stream: AsyncStream<T>
    public let continuation: AsyncStream<T>.Continuation

    init() {
        (stream, continuation) = AsyncStream<T>.makeStream(bufferingPolicy: .bufferingNewest(0))
    }

}
