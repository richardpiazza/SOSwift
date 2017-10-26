import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class DateOnlyTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var validDateString: DateOnly?
        var invalidString: DateOnly?
        var invalidDataType: DateOnly?
        var nilValue: DateOnly?
        
        private enum CodingKeys: String, CodingKey {
            case validDateString
            case invalidString
            case invalidDataType
            case nilValue
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.validDateString = try container.decodeDateOnlyIfPresent(forKey: .validDateString)
            self.invalidString = try container.decodeDateOnlyIfPresent(forKey: .invalidString)
            self.invalidDataType = try container.decodeDateOnlyIfPresent(forKey: .invalidDataType)
            self.nilValue = try container.decodeDateOnlyIfPresent(forKey: .nilValue)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.validDateString, forKey: .validDateString)
            try container.encodeIfPresent(self.invalidString, forKey: .invalidString)
            try container.encodeIfPresent(self.invalidDataType, forKey: .invalidDataType)
            try container.encodeIfPresent(self.nilValue, forKey: .nilValue)
        }
    }
    
    var dateComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone(secondsFromGMT: 0), era: nil, year: 2017, month: 10, day: 18, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
        
        testObject.validDateString = componentsDate.dateOnly
        
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
