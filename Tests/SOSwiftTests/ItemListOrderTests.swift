import XCTest
@testable import SOSwift

class ItemListOrderTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(ItemListOrder.allCases.count, 3)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(ItemListOrder.ascending.displayValue, "Ascending")
        XCTAssertEqual(ItemListOrder.descending.displayValue, "Descending")
        XCTAssertEqual(ItemListOrder.unordered.displayValue, "Unordered")
    }
    
}
