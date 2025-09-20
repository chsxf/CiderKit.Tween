import Testing
import Foundation
@testable import CiderKit_Tween

struct CGFloatTweenTests {

    private static let from: CGFloat = 0
    private static let to: CGFloat = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues: [CGFloat] = [
        20.000000298023224,
        40.00000059604645,
        60.00000238418579,
        80.0000011920929,
        Self.to
    ]

    @Test("CGFloat Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGFloat.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

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
