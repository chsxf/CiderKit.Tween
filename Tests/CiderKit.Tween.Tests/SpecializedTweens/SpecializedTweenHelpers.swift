import Testing
@testable import CiderKit_Tween

func genericUpdateTask<T: Sendable & Equatable>(tween: Tween<T>, expectedValues: [T]) -> Task<T, Never> {
    Task {
        var currentIndex = 0
        var returnValue = expectedValues[0]

        for await updatedValue in tween.onUpdate {
            returnValue = updatedValue

            let expectedValue = expectedValues[currentIndex]
            #expect(updatedValue == expectedValue)
            currentIndex += 1
        }

        return returnValue
    }
}
