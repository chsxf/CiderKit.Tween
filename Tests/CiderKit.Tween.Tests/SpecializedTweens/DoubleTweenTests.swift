import Testing
import Foundation
@testable import CiderKit_Tween

struct DoubleTweenTests {

    private static let from: Double = 0
    private static let to: Double = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues: [Double] = [
        20.000000298023224, 40.00000059604645, 60.00000238418579, 80.0000011920929, 100]

    @Test("Double Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await Double.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

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

    private static let simd2From = SIMD2<Double>()
    private static let simd2To = SIMD2<Double>(100, 100)
    private static let simd2ExpectedValues: [SIMD2<Double>] = [
        SIMD2(20.000000298023224, 20.000000298023224),
        SIMD2(40.00000059604645, 40.00000059604645),
        SIMD2(60.00000238418579, 60.00000238418579),
        SIMD2(80.0000011920929, 80.0000011920929),
        Self.simd2To
    ]

    @Test("SIMD2<Double> Tween Test", .tags(.specializedTweenTest))
    func simd2tweenTest() async throws {
        let tween = await SIMD2<Double>.tween(.fromTo(Self.simd2From, Self.simd2To), duration: Self.duration, manualUpdate: true)

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

    private static let simd3From = SIMD3<Double>()
    private static let simd3To = SIMD3<Double>(100, 100, 100)
    private static let simd3ExpectedValues: [SIMD3<Double>] = [
        SIMD3(20.000000298023224, 20.000000298023224, 20.000000298023224),
        SIMD3(40.00000059604645, 40.00000059604645, 40.00000059604645),
        SIMD3(60.00000238418579, 60.00000238418579, 60.00000238418579),
        SIMD3(80.0000011920929, 80.0000011920929, 80.0000011920929),
        Self.simd3To
    ]

    @Test("SIMD3<Double> Tween Test", .tags(.specializedTweenTest))
    func simd3tweenTest() async throws {
        let tween = await SIMD3<Double>.tween(.fromTo(Self.simd3From, Self.simd3To), duration: Self.duration, manualUpdate: true)

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

    private static let simd4From = SIMD4<Double>()
    private static let simd4To = SIMD4<Double>(lowHalf: simd2To, highHalf: simd2To)
    private static let simd4ExpectedValues = simd2ExpectedValues.map { SIMD4(lowHalf: $0, highHalf: $0) }

    @Test("SIMD4<Double> Tween Test", .tags(.specializedTweenTest))
    func simd4tweenTest() async throws {
        let tween = await SIMD4<Double>.tween(.fromTo(Self.simd4From, Self.simd4To), duration: Self.duration, manualUpdate: true)

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

    private static let simd8From = SIMD8<Double>()
    private static let simd8To = SIMD8<Double>(lowHalf: simd4To, highHalf: simd4To)
    private static let simd8ExpectedValues = simd4ExpectedValues.map { SIMD8(lowHalf: $0, highHalf: $0) }

    @Test("SIMD8<Double> Tween Test", .tags(.specializedTweenTest))
    func simd8tweenTest() async throws {
        let tween = await SIMD8<Double>.tween(.fromTo(Self.simd8From, Self.simd8To), duration: Self.duration, manualUpdate: true)

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

    private static let simd16From = SIMD16<Double>()
    private static let simd16To = SIMD16<Double>(lowHalf: simd8To, highHalf: simd8To)
    private static let simd16ExpectedValues = simd8ExpectedValues.map { SIMD16(lowHalf: $0, highHalf: $0) }

    @Test("SIMD16<Double> Tween Test", .tags(.specializedTweenTest))
    func simd16tweenTest() async throws {
        let tween = await SIMD16<Double>.tween(.fromTo(Self.simd16From, Self.simd16To), duration: Self.duration, manualUpdate: true)

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

    private static let simd32From = SIMD32<Double>()
    private static let simd32To = SIMD32<Double>(lowHalf: simd16To, highHalf: simd16To)
    private static let simd32ExpectedValues = simd16ExpectedValues.map { SIMD32(lowHalf: $0, highHalf: $0) }

    @Test("SIMD32<Double> Tween Test", .tags(.specializedTweenTest))
    func simd32tweenTest() async throws {
        let tween = await SIMD32<Double>.tween(.fromTo(Self.simd32From, Self.simd32To), duration: Self.duration, manualUpdate: true)

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

    private static let simd64From = SIMD64<Double>()
    private static let simd64To = SIMD64<Double>(lowHalf: simd32To, highHalf: simd32To)
    private static let simd64ExpectedValues = simd32ExpectedValues.map { SIMD64(lowHalf: $0, highHalf: $0) }

    @Test("SIMD64<Double> Tween Test", .tags(.specializedTweenTest))
    func simd64tweenTest() async throws {
        let tween = await SIMD64<Double>.tween(.fromTo(Self.simd64From, Self.simd64To), duration: Self.duration, manualUpdate: true)

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

}
