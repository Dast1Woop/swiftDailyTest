import XCTest
@testable import swiftPackageTest

final class swiftPackageTestTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swiftPackageTest().text, "Hello, World!")
        
        XCTAssertEqual(swiftPackageTest().add(num1: 1, num2: 2), 3)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
