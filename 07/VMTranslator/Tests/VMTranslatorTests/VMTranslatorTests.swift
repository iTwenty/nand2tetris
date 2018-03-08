import XCTest
@testable import VMTranslator

class VMTranslatorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(VMTranslator().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
