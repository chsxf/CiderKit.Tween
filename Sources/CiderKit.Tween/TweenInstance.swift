import Foundation

internal protocol TweenInstance: AnyObject, Sendable {

    var options: TweenOptions { get async }
    var elapsedTime: TimeInterval { get async }

    var isRunning: Bool { get async }
    var loopCount: UInt { get async }

    func update(additionalElapsedTime: TimeInterval) async
    func stop(complete: Bool) async

}
