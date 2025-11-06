/// Enumerations describing the start and end values of low-level tweens
///
/// This enumeration is used with low-level tween helpers that requires a process to retrieve start and from values from the tweened values
public enum TweenDetailedTravel<T: Sendable>: Sendable {

    /// Using absolute values
    /// - Parameters:
    ///     - from: Start value
    ///     - to: End value
    case fromTo(_ from: T, _ to: T)

    /// Using an absolute end value
    ///  - Parameters:
    ///     - to: End value
    ///     - deferredFrom: Function called when the tween actually starts to recover the start value
    case to(_ to: T, _ deferredFrom: TweenData<T>.DeferredValueAccessor)

    /// Using a relative end value
    /// - Parameters:
    ///     - by: Relative offset from the start value
    ///     - deferredFrom: Function called when the tween actually starts to recover the start value
    ///     - relativeAccessorFactory: Function to create a function to retrieve the end value of tween relative to the start value
    case by(_ by: T, _ deferredFrom: TweenData<T>.DeferredValueAccessor, _ relativeAccessorFactory: TweenSimpleTravel<T>.RelativeAccessorFactory)

    /// Converts to a ``TweenData`` instance
    /// - Parameters:
    ///     - interpolator: Function that will compute the interpolation
    public func toTweenData(interpolator: @escaping TweenData<T>.InterpolatorFunction) -> TweenData<T> {
        switch self {
            case let .fromTo(from, to):
                return TweenData(from: from, to: to, interpolator: interpolator)

            case let .to(to, deferredFrom):
                return TweenData(deferredFrom: deferredFrom, to: to, interpolator: interpolator)

            case let .by(by, deferredFrom, relativeAccessorFactory):
                return TweenData(deferredFrom: deferredFrom, to: relativeAccessorFactory(by), interpolator: interpolator)
        }
    }

}
