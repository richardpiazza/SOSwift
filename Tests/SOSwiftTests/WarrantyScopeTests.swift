import XCTest
@testable import SOSwift

class WarrantyScopeTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(WarrantyScope.allCases.count, 3)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(WarrantyScope.bringInLabor.displayValue, "Bring In - Labor Only")
        XCTAssertEqual(WarrantyScope.bringInPartsOrLabor.displayValue, "Bring In - Parts & Labor")
        XCTAssertEqual(WarrantyScope.pickupPartsOrLabor.displayValue, "Pick Up - Parts & Labor")
    }
    
}
