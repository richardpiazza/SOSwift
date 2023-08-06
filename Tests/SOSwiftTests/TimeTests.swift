import XCTest
@testable import SOSwift

class TimeTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var time: Time?
    }
    
    func testDecode() throws {
        let json = """
        {
            "time" : "12:21:33Z"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        XCTAssertNotNil(testClass.time)
        
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.gmt, from: testClass.time!.rawValue)
        
        XCTAssertEqual(dateComponents.hour, 12)
        XCTAssertEqual(dateComponents.minute, 21)
        XCTAssertEqual(dateComponents.second, 33)
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let dateComponents = DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: nil, month: nil, day: nil, hour: 11, minute: 22, second: 33, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        
        testObject.time = Time(rawValue: dateComponents.date!)
        
        let dictionary = try testObject.asDictionary()
        let time = dictionary["time"] as? String
        
        XCTAssertEqual(time, "11:22:33Z")
    }
    
    func testEquatability() throws {
        let date = Date()
        
        let time1 = Time(rawValue: date)
        let time2 = Time(rawValue: date)
        let time3 = Time(rawValue: Date(timeIntervalSinceNow: -20))
        
        XCTAssertEqual(time1, time2)
        XCTAssertNotEqual(time1, time3)
    }
}
