/// Errors produced when manipulating ```Easing``` types
public enum EasingError: Error {

    /// Thrown when trying to encode ```Easing/custom(_:_:)```
    case encodingCustom

    /// Thrown when trying to decode an unsupported ```Easing``` case, including ```Easing/custom(_:_:)```
    case unknownEncodedEasing

    // Thrown when trying to create a `steps` easing with less than one step
    case tooFewSteps

}
