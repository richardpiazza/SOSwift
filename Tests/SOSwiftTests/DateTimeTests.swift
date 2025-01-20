@testable import SOSwift
import XCTest

class DateTimeTests: XCTestCase {

    public static let dateTime1Components = DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 29, hour: 18, minute: 40, second: 37, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    public static let dateTime1String = "2019-06-29T18:40:37Z"
    public static let dateTime1 = DateTime(rawValue: dateTime1Components.date!)

    public static let dateTime2Components = DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 28, hour: 8, minute: 30, second: 0, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    public static let dateTime2String = "2019-06-28T08:30:00Z"
    public static let dateTime2 = DateTime(rawValue: dateTime2Components.date!)

    public static let dateTime3Components = DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 28, hour: 9, minute: 30, second: 0, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    public static let dateTime3String = "2019-06-28T09:30:00Z"
    public static let dateTime3 = DateTime(rawValue: dateTime3Components.date!)

    fileprivate class TestClass: Codable, Schema {
        var dateTime: DateTime?
    }

    func testDecode() throws {
        let json = """
        {
            "dateTime": "2019-06-29T18:40:37Z"
        }
        """

        let testClass = try TestClass.make(with: json)
        XCTAssertNotNil(testClass.dateTime)
        XCTAssertNotNil(DateTimeTests.dateTime1Components.date)

        let compare = Calendar.current.compare(testClass.dateTime!.rawValue, to: DateTimeTests.dateTime1Components.date!, toGranularity: .second)
        XCTAssertEqual(compare, .orderedSame)
    }

    func testEncode() throws {
        XCTAssertNotNil(DateTimeTests.dateTime1Components.date)

        let testClass = TestClass()
        testClass.dateTime = DateTimeTests.dateTime1

        let dictionary = try testClass.asDictionary()

        let dateTime = dictionary["dateTime"] as? String

        XCTAssertEqual(dateTime, DateTime(stringValue: DateTimeTests.dateTime1String)?.stringValue)
    }

    func testEquatability() throws {
        let date = Date()

        let dateTime1 = DateTime(rawValue: date)
        let dateTime2 = DateTime(rawValue: date)
        let dateTime3 = DateTime(rawValue: Date(timeIntervalSinceNow: -1200))

        XCTAssertEqual(dateTime1, dateTime2)
        XCTAssertNotEqual(dateTime1, dateTime3)
    }
}
