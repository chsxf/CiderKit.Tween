import Testing
import Foundation
@testable import CiderKit_Tween

struct IntTweenTests {

    private static let from: Int = 0
    private static let to: Int = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let expectedValues = [20, 40, 60, 80, 100]

    @Test("Int Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await Int.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

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

    private static let simd2From = SIMD2<Int>()
    private static let simd2To = SIMD2<Int>(100, 100)
    private static let simd2ExpectedValues = [
        SIMD2<Int>(20, 20),
        SIMD2<Int>(40, 40),
        SIMD2<Int>(60, 60),
        SIMD2<Int>(80, 80),
        SIMD2<Int>(100, 100)
    ]

    @Test("SIMD2<Int> Tween Test", .tags(.specializedTweenTest))
    func simd2tweenTest() async throws {
        let tween = await SIMD2<Int>.tween(.fromTo(Self.simd2From, Self.simd2To), duration: Self.duration, manualUpdate: true)

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

    private static let simd3From = SIMD3<Int>()
    private static let simd3To = SIMD3<Int>(100, 100, 100)
    private static let simd3ExpectedValues = [
        SIMD3<Int>(20, 20, 20),
        SIMD3<Int>(40, 40, 40),
        SIMD3<Int>(60, 60, 60),
        SIMD3<Int>(80, 80, 80),
        SIMD3<Int>(100, 100, 100)
    ]

    @Test("SIMD3<Int> Tween Test", .tags(.specializedTweenTest))
    func simd3tweenTest() async throws {
        let tween = await SIMD3<Int>.tween(.fromTo(Self.simd3From, Self.simd3To), duration: Self.duration, manualUpdate: true)

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

    private static let simd4From = SIMD4<Int>()
    private static let simd4To = SIMD4<Int>(lowHalf: simd2To, highHalf: simd2To)
    private static let simd4ExpectedValues = Self.simd2ExpectedValues.map { SIMD4(lowHalf: $0, highHalf: $0) }

    @Test("SIMD4<Int> Tween Test", .tags(.specializedTweenTest))
    func simd4tweenTest() async throws {
        let tween = await SIMD4<Int>.tween(.fromTo(Self.simd4From, Self.simd4To), duration: Self.duration, manualUpdate: true)

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

    private static let simd8From = SIMD8<Int>()
    private static let simd8To = SIMD8<Int>(lowHalf: simd4To, highHalf: simd4To)
    private static let simd8ExpectedValues = Self.simd4ExpectedValues.map { SIMD8(lowHalf: $0, highHalf: $0) }

    @Test("SIMD8<Int> Tween Test", .tags(.specializedTweenTest))
    func simd8tweenTest() async throws {
        let tween = await SIMD8<Int>.tween(.fromTo(Self.simd8From, Self.simd8To), duration: Self.duration, manualUpdate: true)

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

    private static let simd16From = SIMD16<Int>()
    private static let simd16To = SIMD16<Int>(lowHalf: simd8To, highHalf: simd8To)
    private static let simd16ExpectedValues = Self.simd8ExpectedValues.map { SIMD16(lowHalf: $0, highHalf: $0) }

    @Test("SIMD16<Int> Tween Test", .tags(.specializedTweenTest))
    func simd16tweenTest() async throws {
        let tween = await SIMD16<Int>.tween(.fromTo(Self.simd16From, Self.simd16To), duration: Self.duration, manualUpdate: true)

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

    private static let simd32From = SIMD32<Int>()
    private static let simd32To = SIMD32<Int>(lowHalf: simd16To, highHalf: simd16To)
    private static let simd32ExpectedValues = Self.simd16ExpectedValues.map { SIMD32(lowHalf: $0, highHalf: $0) }

    @Test("SIMD32<Int> Tween Test", .tags(.specializedTweenTest))
    func simd32tweenTest() async throws {
        let tween = await SIMD32<Int>.tween(.fromTo(Self.simd32From, Self.simd32To), duration: Self.duration, manualUpdate: true)

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

    private static let simd64From = SIMD64<Int>()
    private static let simd64To = SIMD64<Int>(lowHalf: simd32To, highHalf: simd32To)
    private static let simd64ExpectedValues = Self.simd32ExpectedValues.map { SIMD64(lowHalf: $0, highHalf: $0) }

    @Test("SIMD64<Int> Tween Test", .tags(.specializedTweenTest))
    func simd64tweenTest() async throws {
        let tween = await SIMD64<Int>.tween(.fromTo(Self.simd64From, Self.simd64To), duration: Self.duration, manualUpdate: true)

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
