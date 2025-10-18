import Testing
@testable import CiderKit_Tween

struct EasingFunctionsTests {

    private static let epsilon: Float = 0.0000015
    
    private let testData: TestData

    init() throws {
        testData = try loadEasingFunctionsTestData()
    }

    @Test(arguments: Easing.allCases)
    func easingFunctionTest(easing: Easing) async throws {
        let testData = try #require(testData[easing.description])
        let easingFunction = easing.easingFunction()

        for entry in testData {
            let easedValue = easingFunction(entry.timing)
            let diff = abs(easedValue - entry.expectedValue)
            #expect(diff < Self.epsilon)
        }
    }
    
    private static let stepsCases: [Easing] = [
        try! Easing.steps(2, jumpType: .jumpStart),
        try! Easing.steps(4, jumpType: .jumpEnd),
        try! Easing.steps(5, jumpType: .jumpNone),
        try! Easing.steps(3, jumpType: .jumpBoth)
    ]
    
    @Test(arguments: Self.stepsCases)
    func stepsEasingFunctionTest(easing: Easing) async throws {
        let testData = try #require(testData[easing.description])
        let easingFunction = easing.easingFunction()
        
        for entry in testData {
            let easedValue = easingFunction(entry.timing)
            let diff = abs(easedValue - entry.expectedValue)
            #expect(diff < Self.epsilon)
        }
    }

}
