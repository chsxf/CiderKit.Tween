import Testing
import Foundation
@testable import CiderKit_Tween

struct CGRectTweenTests {

    private static let from: CGRect = CGRect(x: 0, y: 100, width: 250, height: 500)
    private static let to: CGRect = CGRect(x: 50, y: 10, width: 100, height: 400)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues = [
        CGRect(x: 10.000000149011612, y: 81.9999997317791, width: 219.99999955296516, height: 479.9999997019768),
        CGRect(x: 20.000000298023224, y: 63.9999994635582, width: 189.99999910593033, height: 459.99999940395355),
        CGRect(x: 30.000001192092896, y: 45.99999785423279, width: 159.9999964237213, height: 439.9999976158142),
        CGRect(x: 40.00000059604645, y: 27.999998927116394, width: 129.99999821186066, height: 419.9999988079071),
        Self.to
    ]

    @Test("CGRect Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGRect.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

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
