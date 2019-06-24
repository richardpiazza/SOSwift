import XCTest
@testable import SOSwift

class DateOnlyTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var validDateString: DateOnly?
        var invalidString: DateOnly?
        var invalidDataType: DateOnly?
        var nilValue: DateOnly?
    }
    
    var dateComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.current, era: nil, year: 2017, month: 10, day: 18, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "validDateString" : "2017-10-18",
                "invalidString" : "invalid",
                "invalidDataType" : 42
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let validDateString = testObject.validDateString else {
            XCTFail()
            return
        }
        
        guard let validDateDate = validDateString.date else {
            XCTFail()
            return
        }
        
        guard let componentsDate = dateComponents.date else {
            XCTFail()
            return
        }
        
        let compare = Calendar.current.compare(validDateDate, to: componentsDate, toGranularity: .day)
        XCTAssertEqual(compare, .orderedSame)
        
        XCTAssertNil(testObject.invalidString)
        XCTAssertNil(testObject.invalidDataType)
        XCTAssertNil(testObject.nilValue)
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        guard let componentsDate = dateComponents.date else {
            XCTFail()
            return
        }
        
        testObject.validDateString = DateOnly(date: componentsDate)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let valid = dictionary["validDateString"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(valid, "2017-10-18")
    }
}
