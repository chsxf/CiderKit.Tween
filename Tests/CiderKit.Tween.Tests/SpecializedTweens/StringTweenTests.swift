import Testing
import Foundation
@testable import CiderKit_Tween

struct StringTweenTests {

    @Test("Increasing String Tween Test", .tags(.specializedTweenTest))
    func increasingTweenTest() async throws {
        let from = ""
        let to = "A nice text"

        let tween = await String.tween(.fromTo(from, to), duration: 10, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: [
            "",
            "A",
            "A",
            "A ",
            "A ",
            "A n",
            "A n",
            "A ni",
            "A ni",
            "A nic",
            "A nice",
            "A nice",
            "A nice ",
            "A nice ",
            "A nice t",
            "A nice t",
            "A nice te",
            "A nice te",
            "A nice tex",
            "A nice text",
            "A nice text"
        ])

        let tweenTask = Task {
            for _ in 0..<20 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: 0.5)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == to)
    }

    @Test("Decreasing String Tween Test", .tags(.specializedTweenTest))
    func decreasingTweenTest() async throws {
        let from = "A nice text"
        let to = ""

        let tween = await String.tween(.fromTo(from, to), duration: 10, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: [
            "A nice tex",
            "A nice te",
            "A nice te",
            "A nice t",
            "A nice t",
            "A nice ",
            "A nice ",
            "A nice",
            "A nice",
            "A nic",
            "A ni",
            "A ni",
            "A n",
            "A n",
            "A ",
            "A ",
            "A",
            "A",
            "",
            ""
        ])

        let tweenTask = Task {
            for _ in 0..<20 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: 0.5)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == to)
    }

    @Test("Decreasing From Longer String Tween Test", .tags(.specializedTweenTest))
    func decreasingFromLongerTweenTest() async throws {
        let from = "The longer text to start from"
        let to = "A nice text"

        let tween = await String.tween(.fromTo(from, to), duration: 10, manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: [
            "The longer text to start fro",
            "Ahe longer text to start fr",
            "Ahe longer text to start f",
            "A e longer text to start ",
            "A e longer text to start",
            "A n longer text to star",
            "A n longer text to sta",
            "A nilonger text to st",
            "A nilonger text to s",
            "A niconger text to s",
            "A nicenger text to ",
            "A nicenger text to",
            "A nice ger text t",
            "A nice ger text ",
            "A nice ter text",
            "A nice ter tex",
            "A nice ter te",
            "A nice ter t",
            "A nice tex ",
            "A nice text"
        ])

        let tweenTask = Task {
            for _ in 0..<20 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: 0.5)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == to)
    }

    @Test("Increasing Scrambled String Tween Test", .tags(.specializedTweenTest))
    func increasingScrambledTweenTest() async throws {
        let from = ""
        let to = "A nice text"

        let tween = await String.tween(.fromTo(from, to), duration: 10, scramble: true, scrambleCharacters: "-", manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: [
            "-----------",
            "A----------",
            "A----------",
            "A ---------",
            "A ---------",
            "A n--------",
            "A n--------",
            "A ni-------",
            "A ni-------",
            "A nic------",
            "A nice-----",
            "A nice-----",
            "A nice ----",
            "A nice ----",
            "A nice t---",
            "A nice t---",
            "A nice te--",
            "A nice te--",
            "A nice tex-",
            "A nice text",
            "A nice text"
        ])

        let tweenTask = Task {
            for _ in 0..<20 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: 0.5)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == to)
    }

    @Test("Deacreasing Scrambled String Tween Test", .tags(.specializedTweenTest))
    func decreasingScrambledTweenTest() async throws {
        let from = "-----------------"
        let to = "A nice text"

        let tween = await String.tween(.fromTo(from, to), duration: 10, scramble: true, scrambleCharacters: "-", manualUpdate: true)

        let updateTask = genericUpdateTask(tween: tween, expectedValues: [
            "----------------",
            "A---------------",
            "A---------------",
            "A -------------",
            "A -------------",
            "A n------------",
            "A n-----------",
            "A ni----------",
            "A ni----------",
            "A nic---------",
            "A nice-------",
            "A nice-------",
            "A nice ------",
            "A nice -----",
            "A nice t----",
            "A nice t----",
            "A nice te--",
            "A nice te--",
            "A nice tex-",
            "A nice text",
            "A nice text"
        ])

        let tweenTask = Task {
            for _ in 0..<20 {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: 0.5)
            }
        }

        let (updateFinalValue, _) = try await (updateTask.value, tweenTask.value)
        #expect(updateFinalValue == to)
    }

}
