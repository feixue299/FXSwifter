import XCTest
@testable import FXSwifter

final class FXSwifterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FXSwifter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
