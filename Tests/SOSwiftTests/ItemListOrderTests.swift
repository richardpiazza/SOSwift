import XCTest
@testable import SOSwift

class ItemListOrderTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(ItemListOrder.allCases.count, 3)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(ItemListOrder.ascending.displayValue, "Ascending")
        XCTAssertEqual(ItemListOrder.descending.displayValue, "Descending")
        XCTAssertEqual(ItemListOrder.unordered.displayValue, "Unordered")
    }
    
}
