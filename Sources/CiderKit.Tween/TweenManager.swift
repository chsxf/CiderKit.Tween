import Foundation
#if os(macOS)
import AppKit
#endif

/// Global actor responsible for managing automatic tweens
///
/// `TweenManager` relies on the `CADisplayLink` class to obtain animation timings based on the current display refresh rate.
///
/// > Warning: Unfortunately, `CADisplayLink` instances are obtained differently on macOS and the other platforms.
/// Consequently, you will need to call one of the available `start` functions for the tweens to animate automatically.
@globalActor
public actor TweenManager: GlobalActor {

    /// Accessor to the shared instance of the global actor
    public static let shared = TweenManager()

    private var runningTweenInstances = [TweenInstance]()
    private var runningSequences = [Sequence]()
    private var displayLinkProxy: DisplayLinkProxy?

    internal var runningTweenInstanceCount: Int { runningTweenInstances.count }

#if os(macOS)
    /// Starts the `TweenManager` by getting a `CADisplayLink` instance from an `NSView`. Available on macOS only.
    ///
    /// - Parameter view: View from which to get the `CADisplayLink` instance
    @available(macOS 14, *)
    public func startFrom(view: NSView) async {
        guard displayLinkProxy == nil else {
            fatalError("TweenManager already initialized")
        }

        displayLinkProxy = await DisplayLinkProxy(view: view)
        startPollingTimeIntervals()
    }

    /// Starts the `TweenManager` by getting a `CADisplayLink` instance from an `NSWindow`. Available on macOS only.
    ///
    /// - Parameter window: Window from which to get the `CADisplayLink` instance
    @available(macOS 14, *)
    public func startFrom(window: NSWindow) async {
        guard displayLinkProxy == nil else {
            fatalError("TweenManager already initialized")
        }

        displayLinkProxy = await DisplayLinkProxy(window: window)
        startPollingTimeIntervals()
    }
#endif

    /// Starts the `TweenManager`.  Available on platforms other than macOS.
    @available(iOS 13, tvOS 13, macCatalyst 13, visionOS 1, *)
    public func start() async {
        #if !os(macOS)
        displayLinkProxy = await DisplayLinkProxy()
        startPollingTimeIntervals()
        #endif
    }

    func register(tweenInstance: TweenInstance) {
        if !runningTweenInstances.contains(where: { $0 === tweenInstance }) {
            runningTweenInstances.insert(tweenInstance, at: 0)
        }
    }

    func unregister(tweenInstance: TweenInstance) {
        runningTweenInstances.removeAll { $0 === tweenInstance }
    }

    func register(sequence: Sequence) {
        if !runningSequences.contains(where: { $0 === sequence }) {
            runningSequences.insert(sequence, at: 0)
        }
    }
    
    func unregister(sequence: Sequence) {
        runningSequences.removeAll { $0 === sequence }
    }
    
    func update(additionalElapsedTime: TimeInterval) async {
        for i in stride(from: runningSequences.count - 1, through: 0, by: -1) {
            let sequence = runningSequences[i]
            await sequence.update(additionalElapsedTime: additionalElapsedTime)
            
            await Task.yield()
        }
        
        for i in stride(from: runningTweenInstances.count - 1, through: 0, by: -1) {
            let tween = runningTweenInstances[i]
            if await tween.isRunning {
                await tween.update(additionalElapsedTime: additionalElapsedTime)
            }

            await Task.yield()
        }
    }

    private func startPollingTimeIntervals() {
        guard let displayLinkProxy else {
            fatalError("TweenManager not ready")
        }

        Task {
            for await timeInterval in displayLinkProxy.timeIntervals {
                await update(additionalElapsedTime: timeInterval)
            }
        }
    }
}
