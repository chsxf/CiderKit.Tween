import Testing
import Foundation
import CoreGraphics
@testable import CiderKit_Tween

struct CGColorTweenTests {

    private static let from: CGColor = CGColor(srgbRed: 1, green: 0, blue: 0, alpha: 0.5)
    private static let to: CGColor = CGColor(srgbRed: 0, green: 1, blue: 0, alpha: 1)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues: [CGColor] = [
        CGColor(srgbRed: 0.7999999970197678, green: 0.20000000298023224, blue: 0, alpha: 0.6000000014901161),
        CGColor(srgbRed: 0.5999999940395355, green: 0.4000000059604645, blue: 0.0, alpha: 0.7000000029802322),
        CGColor(srgbRed: 0.3999999761581421, green: 0.6000000238418579, blue: 0.0, alpha: 0.800000011920929),
        CGColor(srgbRed: 0.19999998807907104, green: 0.800000011920929, blue: 0.0, alpha: 0.9000000059604645),
        Self.to
    ]

    @Test("CGColor Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGColor.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

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
