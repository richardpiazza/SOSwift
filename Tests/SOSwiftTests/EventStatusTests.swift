import XCTest
@testable import SOSwift

class EventStatusTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(EventStatus.allCases.count, 4)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(EventStatus.cancelled.displayValue, "Cancelled")
        XCTAssertEqual(EventStatus.postponed.displayValue, "Postponed")
        XCTAssertEqual(EventStatus.rescheduled.displayValue, "Rescheduled")
        XCTAssertEqual(EventStatus.scheduled.displayValue, "Scheduled")
    }
    
}
