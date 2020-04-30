import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Csecp256k1Tests.allTests),
    ]
}
#endif
