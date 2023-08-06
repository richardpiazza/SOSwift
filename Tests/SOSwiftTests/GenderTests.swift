import XCTest
@testable import SOSwift

class GenderTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(Gender.allCases.count, 2)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(Gender.female.displayValue, "Female")
        XCTAssertEqual(Gender.male.displayValue, "Male")
    }
}
