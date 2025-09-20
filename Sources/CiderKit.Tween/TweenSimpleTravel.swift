/// Enumerations describing the start and end values of high-level tweens
///
/// This enumeration is generally used with high-level tween helpers that can internally provide ways to retrieve start and from values from the tweened objects
public enum TweenSimpleTravel<T: Sendable>: Sendable {
    
    /// Using absolute values
    /// - Parameters:
    ///     - from: Start value
    ///     - to: End value
    case fromTo(_ from: T, _ to: T)
    
    /// Using an absolute end value
    ///  - Parameters:
    ///     - to: End value
    case to(_ to: T)
    
    /// Using a relative end value
    /// - Parameters:
    ///     - by: Relative offset from the start value
    case by(_ by: T)
    
    /// Function that creates a ``TweenData/RelativeValueAccessor`` function
    /// - Parameters:
    ///     - by: Relative offset from the start value of the tween
    /// - Returns: A ``TweenData/RelativeValueAccessor`` function that will be then used to compute the actual relative end value for the tween
    public typealias RelativeAccessorFactory = @Sendable (_ by: T) -> TweenData<T>.RelativeValueAccessor
    
    /// Converts this to a ``TweenDetailedTravel`` to use with low-level tweens
    ///
    /// - Parameters:
    ///     - deferredFrom: Function called when the tween actually starts to recover the start value
    ///     - relativeAccessorFactory: Function to create a function to retrieve the end value of tween relative to the start value
    /// - Returns: A converted ``TweenDetailedTravel`` to use with low-level tweens
    public func toDetailedTravel(deferredFrom: @escaping TweenData<T>.DeferredValueAccessor, relativeAccessorFactory: @escaping RelativeAccessorFactory) -> TweenDetailedTravel<T> {
        switch self {
            case let .fromTo(from, to):
                return .fromTo(from, to)
                
            case let .to(to):
                return .to(to, deferredFrom)
                
            case let .by(by):
                return .by(by, deferredFrom, relativeAccessorFactory)
        }
    }
    
}
