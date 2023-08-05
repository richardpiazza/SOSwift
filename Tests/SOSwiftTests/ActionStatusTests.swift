import XCTest
@testable import SOSwift

class ActionStatusTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(ActionStatus.allCases.count, 4)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(ActionStatus.active.displayValue, "Active")
        XCTAssertEqual(ActionStatus.completed.displayValue, "Completed")
        XCTAssertEqual(ActionStatus.failed.displayValue, "Failed")
        XCTAssertEqual(ActionStatus.potential.displayValue, "Potential")
    }
    
}
