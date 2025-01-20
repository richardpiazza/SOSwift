@testable import SOSwift
import XCTest

class BusinessFunctionTests: XCTestCase {

    func testCaseIterable() throws {
        XCTAssertEqual(BusinessFunction.allCases.count, 8)
    }

    func testDisplayValue() throws {
        XCTAssertEqual(BusinessFunction.constructionInstallation.displayValue, "Construction Installation")
        XCTAssertEqual(BusinessFunction.dispose.displayValue, "Dispose")
        XCTAssertEqual(BusinessFunction.leaseOut.displayValue, "Lease Out")
        XCTAssertEqual(BusinessFunction.maintain.displayValue, "Maintain")
        XCTAssertEqual(BusinessFunction.provideService.displayValue, "Provide Service")
        XCTAssertEqual(BusinessFunction.repair.displayValue, "Repair")
        XCTAssertEqual(BusinessFunction.sell.displayValue, "Sell")
        XCTAssertEqual(BusinessFunction.buy.displayValue, "Buy")
    }
}
