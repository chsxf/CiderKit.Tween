import Testing
import Foundation
@testable import CiderKit_Tween

struct TweenTests {

    private static let from: Float = 0
    private static let to: Float = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let loopTimeIncrement: TimeInterval = 6
    private static let updateLoops: Int = 5

    @Test func eventTest() async throws {
        let tween = await Float.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

        let startTask = Task {
            var startRegistered = false
            for await _ in tween.onStart {
                startRegistered = true
            }
            return startRegistered
        }

        let updateTask = Task {
            var updateCount = 0
            for await _ in tween.onUpdate {
                updateCount += 1
            }
            return updateCount
        }

        let completionTask = Task {
            var completionRegistered = false
            for await _ in tween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }

        let tweenTask = Task {
            for _ in 1...Self.updateLoops {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.update(additionalElapsedTime: Self.timeIncrement)
            }

            // Additional call to update that should do nothing
            await tween.update(additionalElapsedTime: Self.timeIncrement)
        }

        let (startFinalValue, updateFinalValue, completionValue, _) = try await (startTask.value, updateTask.value, completionTask.value, tweenTask.value)
        #expect(startFinalValue)
        #expect(updateFinalValue == Self.updateLoops)
        #expect(completionValue)
    }

    @Test func stopAndCompleteTest() async throws {
        let tween = await Float.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

        let completionTask = Task {
            var completionRegistered = false
            for await _ in tween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }

        let tweenTask = Task {
            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.stop(complete: true)
        }

        let (completionValue, _) = try await (completionTask.value, tweenTask.value)
        #expect(completionValue)
    }

    @Test func stopAndDontCompleteTest() async throws {
        let tween = await Float.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true)

        let completionTask = Task {
            var completionRegistered = false
            for await _ in tween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }

        let tweenTask = Task {
            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.stop(complete: false)
        }

        let (completionValue, _) = try await (completionTask.value, tweenTask.value)
        #expect(!completionValue)
    }

    @Test func linearLoopTest() async throws {
        let tween = await Float.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true, loopingType: .normal(loopCount: 3))

        let completionTask = Task {
            var completionRegistered = false
            for await _ in tween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }

        Task {
            var expectedNotifiedLoopNumber = 1
            for await notifiedLoopNumber in tween.onLoopCompletion {
                #expect(notifiedLoopNumber == expectedNotifiedLoopNumber)
                expectedNotifiedLoopNumber += 1
            }
        }

        let tweenTask = Task {
            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.update(additionalElapsedTime: Self.loopTimeIncrement)
            #expect(await tween.elpasedTime == 1)

            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.update(additionalElapsedTime: Self.loopTimeIncrement)
            #expect(await tween.elpasedTime == 2)

            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.update(additionalElapsedTime: Self.loopTimeIncrement)
            #expect(await tween.elpasedTime == Self.duration)
        }

        let (completionValue, _) = try await (completionTask.value, tweenTask.value)
        #expect(completionValue)
    }

    @Test func pingPongLoopTest() async throws {
        let tween = await Float.tween(.fromTo(Self.from, Self.to), duration: Self.duration, manualUpdate: true, loopingType: .pingPong(loopCount: 4))

        let completionTask = Task {
            var completionRegistered = false
            for await _ in tween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }

        Task {
            var expectedNotifiedLoopNumber = 1
            for await notifiedLoopNumber in tween.onLoopCompletion {
                #expect(notifiedLoopNumber == expectedNotifiedLoopNumber)
                expectedNotifiedLoopNumber += 1
            }
        }

        let tweenTask = Task {
            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.update(additionalElapsedTime: Self.loopTimeIncrement)
            #expect(await tween.elpasedTime == 4)

            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.update(additionalElapsedTime: Self.loopTimeIncrement)
            #expect(await tween.elpasedTime == 2)

            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.update(additionalElapsedTime: Self.loopTimeIncrement)
            #expect(await tween.elpasedTime == 2)

            try await Task.sleep(nanoseconds: tweenTaskDelay)
            await tween.update(additionalElapsedTime: Self.loopTimeIncrement)
            #expect(await tween.elpasedTime == 0)
        }

        let (completionValue, _) = try await (completionTask.value, tweenTask.value)
        #expect(completionValue)
    }

}
