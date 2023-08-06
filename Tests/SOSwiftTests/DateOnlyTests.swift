import XCTest
@testable import SOSwift

class DateOnlyTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var date: DateOnly?
    }
    
    var dateComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2017, month: 10, day: 18, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    func testDecode() throws {
        let json = """
        {
            "date": "2017-10-18"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        XCTAssertNotNil(testClass.date?.rawValue)
        XCTAssertNotNil(dateComponents.date)
        
        var compare = Calendar.current.compare(testClass.date!.rawValue, to: dateComponents.date!, toGranularity: .day)
        XCTAssertEqual(compare, .orderedSame)
        
        let dateOnly = DateOnly(stringValue: "2017-10-18")
        XCTAssertNotNil(dateOnly)
        
        compare = Calendar.current.compare(dateOnly!.rawValue, to: dateComponents.date!, toGranularity: .day)
        XCTAssertEqual(compare, .orderedSame)
        
        XCTAssertNil(DateOnly(stringValue: "abcdefg"))
        
        XCTAssertNoThrow(try DateOnly.makeDate(from: "2001-01-01"))
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.date = DateOnly(rawValue: dateComponents.date!)
        
        let dictionary = try testClass.asDictionary()
        let valid = dictionary["date"] as? String
        
        XCTAssertEqual(valid, "2017-10-18")
    }
    
    func testEquatability() throws {
        let date = Date()
        
        let date1 = DateOnly(rawValue: date)
        let date2 = DateOnly(rawValue: date)
        let date3 = DateOnly(rawValue: Date(timeIntervalSinceNow: -1200))
        
        XCTAssertEqual(date1, date2)
        XCTAssertNotEqual(date1, date3)
    }
}
