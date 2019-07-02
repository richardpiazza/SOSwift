import XCTest
@testable import SOSwift

class OfferItemConditionTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(OfferItemCondition.allCases.count, 4)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(OfferItemCondition.damaged.displayValue, "Damaged")
        XCTAssertEqual(OfferItemCondition.new.displayValue, "New")
        XCTAssertEqual(OfferItemCondition.refurbished.displayValue, "Refurbished")
        XCTAssertEqual(OfferItemCondition.used.displayValue, "Used")
    }
    
}
