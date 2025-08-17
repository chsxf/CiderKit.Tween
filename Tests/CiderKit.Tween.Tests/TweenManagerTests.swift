import Testing
@testable import CiderKit_Tween

@Suite(.serialized)
struct TweenManagerTests {

    @Test func registrationTest() async throws {
        #expect(await TweenManager.shared.runningTweenInstanceCount == 0)

        let tween = await Float.tween(from: 0, to: 1, duration: 20)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        let tween2 = await Float.tween(from: 0, to: 1, duration: 20)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 2)

        await tween.stop()
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        await tween2.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        await tween2.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 0)
    }

    @Test func updateTest() async throws {
        _ = await Float.tween(from: 0, to: 1, duration: 20)
        _ = await Float.tween(from: 0, to: 1, duration: 30)

        await TweenManager.shared.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 2)

        await TweenManager.shared.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        await TweenManager.shared.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 0)
    }

}
