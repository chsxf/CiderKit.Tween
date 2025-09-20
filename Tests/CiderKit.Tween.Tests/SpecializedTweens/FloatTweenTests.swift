import Testing
import Foundation
@testable import CiderKit_Tween

struct FloatTweenTests {

    private static let from: Float = 0
    private static let to: Float = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues = [
        20,
        40,
        60.000004,
        80,
        Self.to
    ]

    @Test("Float Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await Float.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

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

    private static let simd2From = SIMD2<Float>()
    private static let simd2To = SIMD2<Float>(100, 100)
    private static let simd2ExpectedValues = [
        SIMD2(20, 20),
        SIMD2(40, 40),
        SIMD2(60.000004, 60.000004),
        SIMD2(80, 80),
        Self.simd2To
    ]

    @Test("SIMD2<Float> Tween Test", .tags(.specializedTweenTest))
    func simd2tweenTest() async throws {
        let tween = await SIMD2<Float>.tween(.fromTo(Self.simd2From, Self.simd2To), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.simd2ExpectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.simd2To)
    }

    private static let simd3From = SIMD3<Float>()
    private static let simd3To = SIMD3<Float>(100, 100, 100)
    private static let simd3ExpectedValues = [
        SIMD3(20, 20, 20),
        SIMD3(40, 40, 40),
        SIMD3(60.000004, 60.000004, 60.000004),
        SIMD3(80, 80, 80),
        Self.simd3To
    ]

    @Test("SIMD3<Float> Tween Test", .tags(.specializedTweenTest))
    func simd3tweenTest() async throws {
        let tween = await SIMD3<Float>.tween(.fromTo(Self.simd3From, Self.simd3To), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.simd3ExpectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.simd3To)
    }

    private static let simd4From = SIMD4<Float>()
    private static let simd4To = SIMD4<Float>(lowHalf: simd2To, highHalf: simd2To)
    private static let simd4ExpectedValues = simd2ExpectedValues.map { SIMD4(lowHalf: $0, highHalf: $0) }

    @Test("SIMD4<Float> Tween Test", .tags(.specializedTweenTest))
    func simd4tweenTest() async throws {
        let tween = await SIMD4<Float>.tween(.fromTo(Self.simd4From, Self.simd4To), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.simd4ExpectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.simd4To)
    }

    private static let simd8From = SIMD8<Float>()
    private static let simd8To = SIMD8<Float>(lowHalf: simd4To, highHalf: simd4To)
    private static let simd8ExpectedValues = simd4ExpectedValues.map { SIMD8(lowHalf: $0, highHalf: $0) }

    @Test("SIMD8<Float> Tween Test", .tags(.specializedTweenTest))
    func simd8tweenTest() async throws {
        let tween = await SIMD8<Float>.tween(.fromTo(Self.simd8From, Self.simd8To), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.simd8ExpectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.simd8To)
    }

    private static let simd16From = SIMD16<Float>()
    private static let simd16To = SIMD16<Float>(lowHalf: simd8To, highHalf: simd8To)
    private static let simd16ExpectedValues = simd8ExpectedValues.map { SIMD16(lowHalf: $0, highHalf: $0) }

    @Test("SIMD16<Float> Tween Test", .tags(.specializedTweenTest))
    func simd16tweenTest() async throws {
        let tween = await SIMD16<Float>.tween(.fromTo(Self.simd16From, Self.simd16To), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.simd16ExpectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.simd16To)
    }

    private static let simd32From = SIMD32<Float>()
    private static let simd32To = SIMD32<Float>(lowHalf: simd16To, highHalf: simd16To)
    private static let simd32ExpectedValues = simd16ExpectedValues.map { SIMD32(lowHalf: $0, highHalf: $0) }

    @Test("SIMD32<Float> Tween Test", .tags(.specializedTweenTest))
    func simd32tweenTest() async throws {
        let tween = await SIMD32<Float>.tween(.fromTo(Self.simd32From, Self.simd32To), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.simd32ExpectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.simd32To)
    }

    private static let simd64From = SIMD64<Float>()
    private static let simd64To = SIMD64<Float>(lowHalf: simd32To, highHalf: simd32To)
    private static let simd64ExpectedValues = simd32ExpectedValues.map { SIMD64(lowHalf: $0, highHalf: $0) }

    @Test("SIMD64<Float> Tween Test", .tags(.specializedTweenTest))
    func simd64tweenTest() async throws {
        let tween = await SIMD64<Float>.tween(.fromTo(Self.simd64From, Self.simd64To), duration: Self.duration, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: Self.simd64ExpectedValues)

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.simd64To)
    }

    static func inverseLinear(_ value: Float) -> Float {
        1.0 - value
    }

    @Test func customEasingTest() async throws {
        let tween = await Float.tween(.fromTo(Self.from, Self.to), duration: Self.duration, easing: .custom(Self.inverseLinear(_:)), manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: [ 80, 60.000004, 39.999996, 19.999998, Self.from ])

        let tweenTask = Task {
            for _ in 1...5 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == Self.from)
    }

}
