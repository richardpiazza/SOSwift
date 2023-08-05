import XCTest
@testable import SOSwift

class BusinessEntityTypeTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(BusinessEntityType.allCases.count, 4)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(BusinessEntityType.business.displayValue, "Business")
        XCTAssertEqual(BusinessEntityType.endUser.displayValue, "End User")
        XCTAssertEqual(BusinessEntityType.publicInstitution.displayValue, "Public Institution")
        XCTAssertEqual(BusinessEntityType.reseller.displayValue, "Reseller")
    }
    
}
