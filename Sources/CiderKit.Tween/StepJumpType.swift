/// Type of value jump in step easing
///
/// See https://developer.mozilla.org/en-US/docs/Web/CSS/easing-function/steps#description for more information
public enum StepJumpType: String, Sendable {
    
    /// Value will jump at the start
    case jumpStart
    
    /// Value will jump at the end
    case jumpEnd
    
    /// Value won't jump neither at the start or the end
    case jumpNone
    
    /// Value will jump at the start and the end
    case jumpBoth
    
    internal func getEasingInterval(stepCount: UInt) -> (Float, Float) {
        switch self {
            case .jumpStart:
                return (1.0 / Float(stepCount), 1)
                
            case .jumpEnd:
                return (0, 1.0 - (1.0 / Float(stepCount)))
                
            case .jumpBoth:
                let start = 1.0 / Float(stepCount + 1)
                return (start, 1.0 - start)
                
            case .jumpNone:
                return (0, 1)
        }
    }

}
