import XCTest
@testable import SOSwift

class DateOnlyTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var validDateString: DateOnly?
        var invalidString: DateOnly?
        var invalidDataType: DateOnly?
        var nilValue: DateOnly?
    }
    
    var dateComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.current, era: nil, year: 2017, month: 10, day: 18, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    func testDecode() throws {
        let json = """
        {
            "validDateString" : "2017-10-18",
            "invalidString" : "invalid",
            "invalidDataType" : 42
        }
        """
        
        let testClass = try TestClass.make(with: json)
        XCTAssertNotNil(testClass.validDateString?.date)
        XCTAssertNil(testClass.invalidString)
        XCTAssertNil(testClass.invalidDataType)
        XCTAssertNil(testClass.nilValue)
        
        XCTAssertNotNil(dateComponents.date)
        
        let compare = Calendar.current.compare(testClass.validDateString!.date!, to: dateComponents.date!, toGranularity: .day)
        XCTAssertEqual(compare, .orderedSame)
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.validDateString = DateOnly(date: dateComponents.date!)
        
        let dictionary = try testClass.asDictionary()
        let valid = dictionary["validDateString"] as? String
        
        XCTAssertEqual(valid, "2017-10-18")
    }
}
