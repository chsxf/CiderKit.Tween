import Testing
@testable import CiderKit_Tween

struct SequenceTests {

    @Test func simpleSequenceTest() async throws {
        let sequence = await Sequence(manualUpdate: true)

        let firstTween = await Float.tween(.fromTo(0, 10), duration: 5)
        try await sequence.append(tween: firstTween)

        let secondTween = await Float.tween(.fromTo(20, 30), duration: 5)
        try await sequence.append(tween: secondTween)

        #expect(await sequence.totalDuration == 10)

        let firstTweenCompletion = Task {
            var completionRegistered = false
            for await _ in firstTween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        let secondTweenCompletion = Task {
            var completionRegistered = false
            for await _ in secondTween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        let startTask = Task {
            var startRegistered = false
            for await _ in await sequence.onStart {
                startRegistered = true
            }
            return startRegistered
        }
        
        let completionTask = Task {
            var completionRegistered = false
            for await _ in await sequence.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        try await Task.sleep(nanoseconds: tweenTaskDelay)
        await sequence.update(additionalElapsedTime: 10)
        
        let (firstTweenCompleted, secondTweenCompleted, sequenceStarted, sequenceCompleted)
            = await (firstTweenCompletion.value, secondTweenCompletion.value, startTask.value, completionTask.value)
        #expect(firstTweenCompleted)
        #expect(secondTweenCompleted)
        #expect(sequenceStarted)
        #expect(sequenceCompleted)
    }
    
    @Test func stopBeforeEndSequenceTest() async throws {
        let sequence = await Sequence(manualUpdate: true)

        let firstTween = await Float.tween(.fromTo(0, 10), duration: 5)
        try await sequence.append(tween: firstTween)

        let secondTween = await Float.tween(.fromTo(20, 30), duration: 5)
        try await sequence.append(tween: secondTween)

        let firstTweenCompletion = Task {
            var completionRegistered = false
            for await _ in firstTween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        let secondTweenCompletion = Task {
            var completionRegistered = false
            for await _ in secondTween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        let completionTask = Task {
            var completionRegistered = false
            for await _ in await sequence.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        try await Task.sleep(nanoseconds: tweenTaskDelay)
        await sequence.update(additionalElapsedTime: 6)
        await sequence.stop(complete: false)
        
        let (firstTweenCompleted, secondTweenCompleted, sequenceCompleted)
            = await (firstTweenCompletion.value, secondTweenCompletion.value, completionTask.value)
        #expect(firstTweenCompleted)
        #expect(!secondTweenCompleted)
        #expect(!sequenceCompleted)
    }
    
    @Test func stopBeforeEndWithCompletionSequenceTest() async throws {
        let sequence = await Sequence(manualUpdate: true)

        let firstTween = await Float.tween(.fromTo(0, 10), duration: 5)
        try await sequence.append(tween: firstTween)

        let secondTween = await Float.tween(.fromTo(20, 30), duration: 5)
        try await sequence.append(tween: secondTween)

        let firstTweenCompletion = Task {
            var completionRegistered = false
            for await _ in firstTween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        let secondTweenCompletion = Task {
            var completionRegistered = false
            for await _ in secondTween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        let completionTask = Task {
            var completionRegistered = false
            for await _ in await sequence.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        try await Task.sleep(nanoseconds: tweenTaskDelay)
        await sequence.update(additionalElapsedTime: 6)
        await sequence.stop(complete: true)
        
        let (firstTweenCompleted, secondTweenCompleted, sequenceCompleted)
            = await (firstTweenCompletion.value, secondTweenCompletion.value, completionTask.value)
        #expect(firstTweenCompleted)
        #expect(secondTweenCompleted)
        #expect(sequenceCompleted)
    }
    
    @Test func editAfterStartSequenceTest() async throws {
        let sequence = await Sequence(manualUpdate: true)

        let firstTween = await Float.tween(.fromTo(0, 10), duration: 5)
        try await sequence.append(tween: firstTween)

        try await Task.sleep(nanoseconds: tweenTaskDelay)
        await sequence.update(additionalElapsedTime: 1)
        
        let secondTween = await Float.tween(.fromTo(20, 30), duration: 5, manualUpdate: true)
        await #expect(throws: SequenceError.modificationAfterStart) {
            try await sequence.append(tween: secondTween)
        }
    }
    
    @Test func sequenceWithTest() async throws {
        let sequence = await Sequence(manualUpdate: true)

        let firstTween = await Float.tween(.fromTo(0, 10), duration: 5)
        try await sequence.append(tween: firstTween)
        #expect(await sequence.totalDuration == 5)

        let loopingTween = await Float.tween(.fromTo(0, 1), duration: 1, loopingType: .normal(loopCount: 0))
        try await sequence.append(tween: loopingTween)
        #expect(await sequence.totalDuration == 5)
        
        let secondTween = await Float.tween(.fromTo(20, 30), duration: 5)
        try await sequence.append(tween: secondTween)
        #expect(await sequence.totalDuration == 10)
        
        try await Task.sleep(nanoseconds: tweenTaskDelay)
        await sequence.update(additionalElapsedTime: 15)
        
        #expect(await firstTween.isComplete)
        #expect(await secondTween.isComplete)
        #expect(await !loopingTween.isComplete)
        #expect(await sequence.isComplete)
    }

}
