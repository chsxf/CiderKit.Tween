import Testing
import Foundation
@testable import CiderKit_Tween

struct CGVectorTweenTests {

    private static let from: CGVector = CGVector(dx: 0, dy: 100)
    private static let to: CGVector = CGVector(dx: 50, dy: 10)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues = [
        CGVector(dx: 10.000000149011612, dy: 81.9999997317791),
        CGVector(dx: 20.000000298023224, dy: 63.9999994635582),
        CGVector(dx: 30.000001192092896, dy: 45.99999785423279),
        CGVector(dx: 40.00000059604645, dy: 27.999998927116394),
        Self.to
    ]

    @Test("CGVector Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGVector.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

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
