import XCTest
@testable import SOSwift

class TimeTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var time: Time?
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "time" : "12:21:33Z"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let time = testObject.time else {
            XCTFail()
            return
        }
        
        guard let date = time.date else {
            XCTFail()
            return
        }
        
        let dateComponents = Calendar.current.dateComponents(in: TimeZone(secondsFromGMT: 0)!, from: date)
        
        XCTAssertEqual(dateComponents.hour, 12)
        XCTAssertEqual(dateComponents.minute, 21)
        XCTAssertEqual(dateComponents.second, 33)
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let dateComponents = DateComponents(calendar: Calendar.current, timeZone: TimeZone(secondsFromGMT: 0), era: nil, year: nil, month: nil, day: nil, hour: 11, minute: 22, second: 33, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        
        testObject.time = Time(date: dateComponents.date!)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let t = dictionary["time"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "11:22:33Z")
    }
}
