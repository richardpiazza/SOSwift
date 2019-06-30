import XCTest
@testable import SOSwift

class DateOnlyOrDateTimeTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var dateOnly: DateOnlyOrDateTime?
        var dateTime: DateOnlyOrDateTime?
        var multiple: [DateOnlyOrDateTime]?
    }
    
    private var dateOnlyComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2017, month: 10, day: 26, hour: nil, minute: nil, second: nil, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    private var dateTimeComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2017, month: 10, day: 26, hour: 7, minute: 58, second: 0, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    func testDecode() throws {
        let json = """
        {
            "dateOnly" : "2017-10-26",
            "dateTime" : "2017-10-26T07:58:00Z"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.dateOnly?.dateOnly?.rawValue, dateOnlyComponents.date)
        XCTAssertNil(testClass.dateOnly?.dateTime)
        XCTAssertEqual(testClass.dateTime?.dateTime?.rawValue, dateTimeComponents.date)
        XCTAssertNil(testClass.dateTime?.dateOnly)
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.dateOnly = .dateOnly(value: DateOnly(stringValue: "2019-06-16")!)
        testClass.dateTime = .dateTime(value: DateTime(stringValue: "2019-06-16T08:14:00-5000")!)
        
        let dictionary = try testClass.asDictionary()
        XCTAssertEqual(dictionary["dateOnly"] as? String, "2019-06-16")
        XCTAssertEqual(dictionary["dateTime"] as? String, "2019-06-16T13:14:00Z")
    }
    
    func testEquatability() throws {
        let date = Date()
        
        let t1 = DateOnlyOrDateTime(DateOnly(rawValue: date))
        let t2 = DateOnlyOrDateTime(DateOnly(rawValue: date))
        let t3 = DateOnlyOrDateTime(DateTime(rawValue: date))
        let t4 = DateOnlyOrDateTime(DateTime(rawValue: date))
        
        XCTAssertEqual(t1, t2)
        XCTAssertNotEqual(t1, t3)
        XCTAssertEqual(t3, t4)
        XCTAssertNotEqual(t2, t4)
    }
}
