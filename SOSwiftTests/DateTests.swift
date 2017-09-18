import XCTest
import SOSwiftVocabulary
@testable import SOSwift

class DateTests: XCTestCase {

    let dateOnly: DateOnly = "2017-05-28"
    let dateTime: DateTime = "2017-05-28T12:30:00-06:00"
    let timeOnly: Time = "12:30:00-06:00"
    let centralStandardTime = TimeZone(abbreviation: "CST")!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDateOnly() {
        let components = DateComponents(calendar: Calendar.current, timeZone: TimeZone(secondsFromGMT: 0), era: 1, year: 2017, month: 5, day: 28, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        guard let expectedDate = components.date else {
            XCTFail()
            return
        }
        
        guard let date = dateOnly.dateOnly else {
            XCTFail()
            return
        }
        
        let result = Calendar.current.compare(expectedDate, to: date, toGranularity: .day)
        XCTAssertEqual(result, .orderedSame)
    }
    
    func testDateTime() {
        var components: DateComponents
        if centralStandardTime.isDaylightSavingTime() {
            components = DateComponents(calendar: Calendar.current, timeZone: centralStandardTime, era: 1, year: 2017, month: 5, day: 28, hour: 13, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        } else {
            components = DateComponents(calendar: Calendar.current, timeZone: centralStandardTime, era: 1, year: 2017, month: 5, day: 28, hour: 12, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        }
        guard let expectedDate = components.date else {
            XCTFail()
            return
        }
        
        guard let date = dateTime.dateTime else {
            XCTFail()
            return
        }
        
        let result = Calendar.current.compare(expectedDate, to: date, toGranularity: .second)
        XCTAssertEqual(result, .orderedSame)
    }
    
    func testTime() {
        let components = DateComponents(calendar: Calendar.current, timeZone: centralStandardTime, era: 1, year: 2000, month: 1, day: 1, hour: 12, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        guard let expectedDate = components.date else {
            XCTFail()
            return
        }
        
        guard let date = timeOnly.time else {
            XCTFail()
            return
        }
        
        let result = Calendar.current.compare(expectedDate, to: date, toGranularity: .second)
        XCTAssertEqual(result, .orderedSame)
    }
}
