import XCTest
@testable import SOSwift

class GenderTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(GenderType.allCases.count, 2)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(GenderType.female.displayValue, "Female")
        XCTAssertEqual(GenderType.male.displayValue, "Male")
    }
}
