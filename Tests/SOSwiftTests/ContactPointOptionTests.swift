import XCTest
@testable import SOSwift

class ContactPointOptionTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(ContactPointOption.allCases.count, 2)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(ContactPointOption.hearingImparedSupported.displayValue, "Hearing Impared Supported")
        XCTAssertEqual(ContactPointOption.tollFree.displayValue, "Toll Free")
    }
    
}
