import Testing
@testable import CiderKit_Tween

@Suite(.serialized)
struct TweenManagerTests {

    private static let defaultOptions = TweenOptions(duration: 20)

    @Test func registrationTest() async throws {
        #expect(await TweenManager.shared.runningTweenInstanceCount == 0)

        let tween = await Float.tween(.fromTo(0, 1), options: Self.defaultOptions)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        let tween2 = await Float.tween(.fromTo(0, 1), options: Self.defaultOptions)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 2)

        await tween.stop()
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        await tween2.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        await tween2.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 0)
    }

    @Test func updateTest() async throws {
        _ = await Float.tween(.fromTo(0, 1), options: Self.defaultOptions)
        _ = await Float.tween(.fromTo(0, 1), options: .init(duration: 30))

        await TweenManager.shared.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 2)

        await TweenManager.shared.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 1)

        await TweenManager.shared.update(additionalElapsedTime: 10)
        #expect(await TweenManager.shared.runningTweenInstanceCount == 0)
    }

}
