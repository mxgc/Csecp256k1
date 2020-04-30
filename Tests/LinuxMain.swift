import XCTest

import Csecp256k1Tests

var tests = [XCTestCaseEntry]()
tests += Csecp256k1Tests.allTests()
XCTMain(tests)
