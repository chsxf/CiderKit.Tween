/// Errors produced when manipulating ```Sequence``` instances
public enum SequenceError: Error {

    /// Thrown when a ```Sequence``` instance is being modified after it has alrady progressed beyond its starting point
    case modificationAfterStart

}
