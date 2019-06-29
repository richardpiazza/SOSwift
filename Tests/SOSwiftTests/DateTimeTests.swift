import XCTest
@testable import SOSwift

class DateTimeTests: XCTestCase {

    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var dateTime: DateTime?
    }
    
    private var dateComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 29, hour: 18, minute: 40, second: 37, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }

    func testDecode() throws {
        let json = """
        {
            "dateTime": "2019-06-29T18:40:37Z"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        XCTAssertNotNil(testClass.dateTime)
        XCTAssertNotNil(dateComponents.date)
        
        let compare = Calendar.current.compare(testClass.dateTime!.rawValue, to: dateComponents.date!, toGranularity: .second)
        XCTAssertEqual(compare, .orderedSame)
    }
    
    func testEncode() throws {
        XCTAssertNotNil(dateComponents.date)
        
        let testClass = TestClass()
        testClass.dateTime = DateTime(rawValue: dateComponents.date!)
        
        let dictionary = try testClass.asDictionary()
        
        let dateTime = dictionary["dateTime"] as? String
        
        XCTAssertEqual(dateTime, DateTime(stringValue: "2019-06-29T18:40:37Z")?.stringValue)
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
