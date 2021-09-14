import XCTest

import swiftPackageTestTests

var tests = [XCTestCaseEntry]()
tests += swiftPackageTestTests.allTests()
XCTMain(tests)
