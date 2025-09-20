import Testing
import Foundation
@testable import CiderKit_Tween

struct CGSizeTweenTests {

    private static let from: CGSize = CGSize(width: 250, height: 500)
    private static let to: CGSize = CGSize(width: 100, height: 400)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues = [
        CGSize(width: 219.99999955296516, height: 479.9999997019768),
        CGSize(width: 189.99999910593033, height: 459.99999940395355),
        CGSize(width: 159.9999964237213, height: 439.9999976158142),
        CGSize(width: 129.99999821186066, height: 419.9999988079071),
        Self.to
    ]

    @Test("CGSize Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGSize.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.expectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.to)
    }

}
