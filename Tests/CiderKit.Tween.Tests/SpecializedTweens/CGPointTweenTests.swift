import Testing
import Foundation
@testable import CiderKit_Tween

struct CGPointTweenTests {

    private static let from: CGPoint = CGPoint(x: 0, y: 100)
    private static let to: CGPoint = CGPoint(x: 50, y: 10)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues = [
        CGPoint(x: 10.000000149011612, y: 81.9999997317791),
        CGPoint(x: 20.000000298023224, y: 63.9999994635582),
        CGPoint(x: 30.000001192092896, y: 45.99999785423279),
        CGPoint(x: 40.00000059604645, y: 27.999998927116394),
        Self.to
    ]

    @Test("CGPoint Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGPoint.tween(.fromTo(Self.from, Self.to), options: .init(duration: Self.duration, manualUpdate: true))

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
