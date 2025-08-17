/// Enumeration of the various looping types supported by tweens
public enum LoopingType: Sendable {

    /// The tween is executed once, without any additional loops.
    case none
    /// The tween will loop normally, by returning to its start value at the begining of each loop.
    /// - Parameter loopCount: 0 means looping indefinitely, 1 means no looping (similar to ```none```) and any value above means the tween will execute `loopCount` times
    case normal(loopCount: UInt)
    /// The tween will loop by progressing alternatively "forward" or "backwards".
    ///
    /// The first execution will progress "forward" (from the start value to the end value), the second execution will progress "backwards"
    /// (from the end value to the start value), and so on.
    ///
    /// - Parameter loopCount: 0 means looping indefinitely, 1 means no looping (similar to ```none```) and any value above means the tween will execute `loopCount` times (progressing "forward" with odd iterations and "backwards" with even iterations)
    case pingPong(loopCount: UInt)

}
