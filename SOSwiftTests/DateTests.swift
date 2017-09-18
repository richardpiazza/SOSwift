import XCTest
import SOSwiftVocabulary
@testable import SOSwift

class DateTests: XCTestCase {

    let dateOnly: DateOnly = "2017-05-28"
    var dateTime: DateTime {
        if Calendar.current.timeZone.isDaylightSavingTime() {
            return "2017-05-28T12:30:00-06:00"
        } else {
            return "2017-05-28T12:30:00-06:00"
        }
    }
    var timeOnly: Time {
        if Calendar.current.timeZone.isDaylightSavingTime() {
            return "12:30:00-06:00"
        } else {
            return "12:30:00-06:00"
        }
    }
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
        
        #if os(Linux)
            let reverseComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
            XCTAssertEqual(reverseComponents.year, 2017)
            XCTAssertEqual(reverseComponents.month, 5)
            XCTAssertEqual(reverseComponents.day, 28)
        #else
            let result = Calendar.current.compare(expectedDate, to: date, toGranularity: .day)
            XCTAssertEqual(result, .orderedSame)
        #endif
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
        
        #if os(Linux)
            let reverseComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .timeZone], from: date)
            XCTAssertEqual(reverseComponents.year, 2017)
            XCTAssertEqual(reverseComponents.month, 5)
            XCTAssertEqual(reverseComponents.day, 28)
            XCTAssertEqual(reverseComponents.hour, 12)
            XCTAssertEqual(reverseComponents.minute, 30)
            XCTAssertEqual(reverseComponents.second, 0)
            XCTAssertEqual(reverseComponents.timeZone, centralStandardTime)
        #else
            let result = Calendar.current.compare(expectedDate, to: date, toGranularity: .second)
            XCTAssertEqual(result, .orderedSame)
        #endif
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
        
        #if os(Linux)
            let reverseComponents = Calendar.current.dateComponents([.hour, .minute, .second, .timeZone], from: date)
            XCTAssertEqual(reverseComponents.hour, 12)
            XCTAssertEqual(reverseComponents.minute, 30)
            XCTAssertEqual(reverseComponents.second, 0)
            XCTAssertEqual(reverseComponents.timeZone, centralStandardTime)
        #else
            let result = Calendar.current.compare(expectedDate, to: date, toGranularity: .second)
            XCTAssertEqual(result, .orderedSame)
        #endif
    }
}
