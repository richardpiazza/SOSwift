import XCTest
@testable import SOSwift

class DayOfWeekTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(DayOfWeek.allCases.count, 8)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(DayOfWeek.friday.displayValue, "Friday")
        XCTAssertEqual(DayOfWeek.monday.displayValue, "Monday")
        XCTAssertEqual(DayOfWeek.publicHolidays.displayValue, "Public Holidays")
        XCTAssertEqual(DayOfWeek.saturday.displayValue, "Saturday")
        XCTAssertEqual(DayOfWeek.sunday.displayValue, "Sunday")
        XCTAssertEqual(DayOfWeek.thursday.displayValue, "Thursday")
        XCTAssertEqual(DayOfWeek.tuesday.displayValue, "Tuesday")
        XCTAssertEqual(DayOfWeek.wednesday.displayValue, "Wednesday")
    }
    
}
