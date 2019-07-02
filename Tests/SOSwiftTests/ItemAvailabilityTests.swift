import XCTest
@testable import SOSwift

class ItemAvailabilityTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(ItemAvailability.allCases.count, 9)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(ItemAvailability.discontinued.displayValue, "Discontinued")
        XCTAssertEqual(ItemAvailability.inStock.displayValue, "In Stock")
        XCTAssertEqual(ItemAvailability.inStoreOnly.displayValue, "In Store Only")
        XCTAssertEqual(ItemAvailability.limitedAvailability.displayValue, "Limited Availability")
        XCTAssertEqual(ItemAvailability.onlineOnly.displayValue, "Online Only")
        XCTAssertEqual(ItemAvailability.outOfStock.displayValue, "Out of Stock")
        XCTAssertEqual(ItemAvailability.preOrder.displayValue, "Pre-Order")
        XCTAssertEqual(ItemAvailability.preSale.displayValue, "Pre-Sale")
        XCTAssertEqual(ItemAvailability.soldOut.displayValue, "Sold Out")
    }
    
}
