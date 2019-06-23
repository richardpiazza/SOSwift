import XCTest
@testable import SOSwift

class DateOnlyOrDateTimeTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var dateOnly: DateOnlyOrDateTime?
        var dateTime: DateOnlyOrDateTime?
        var multiple: [DateOnlyOrDateTime]?
        
        private enum CodingKeys: String, CodingKey {
            case dateOnly
            case dateTime
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.dateOnly = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateOnly)
            self.dateTime = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateTime)
            self.multiple = try container.decodeDateOnlysOrDateTimesIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(dateOnly, forKey: CodingKeys.dateOnly)
            try container.encodeIfPresent(dateTime, forKey: CodingKeys.dateTime)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
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
                "dateOnly" : "2017-10-26",
                "dateTime" : "2017-10-26T07:58:00+6000"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let dateOnly = testObject.dateOnly as? DateOnly else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(dateOnly.date)
        
        guard let dateTime = testObject.dateTime as? DateTime else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(dateTime.date)
    }
    
    func testSingleEncodes() throws {
        let testObject = TestClass()
        testObject.dateOnly = SODateOnlyOrDateTime.dateOnly(value: "2019-06-16")
        testObject.dateTime = SODateOnlyOrDateTime.dateTime(value: "2019-06-16T08:14:00-5000")
        
        let dictionary = try testObject.dictionary()
        XCTAssertEqual(dictionary.keys.count, 2)
        
        guard let dateOnly = dictionary["dateOnly"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(dateOnly, "2019-06-16")
        
        guard let dateTime = dictionary["dateTime"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(dateTime, "2019-06-16T13:14:00Z")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                "2017-10-26",
                "2017-10-26T07:58:00+6000"
            ]
        }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable = try JSONDecoder().decode(TestClass.self, from: data)
        guard let multiple = testable.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        guard let dateOnly = multiple[0] as? SODateOnlyOrDateTime else {
            XCTFail()
            return
        }
        
        guard let dateTime = multiple[1] as? SODateOnlyOrDateTime else {
            XCTFail()
            return
        }
        
        switch dateOnly {
        case .dateOnly(let value):
            let components = DateComponents(calendar: .gregorian, timeZone: .gmt, era: nil, year: 2017, month: 10, day: 26, hour: 5, minute: 0, second: 0, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
            guard let date = value.date, let compare = components.date else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(Calendar.gregorian.compare(date, to: compare, toGranularity: .day), .orderedSame)
        default:
            XCTFail()
        }
        
        switch dateTime {
        case .dateTime(let value):
            let components = DateComponents(calendar: .gregorian, timeZone: .gmt, era: nil, year: 2017, month: 10, day: 26, hour: 1, minute: 58, second: 0, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
            guard let date = value.date, let compare = components.date else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(Calendar.gregorian.compare(date, to: compare, toGranularity: .second), .orderedSame)
        default:
            XCTFail()
        }
    }
    
    func testMultipleEncodes() throws {
        let dateOnly = SODateOnlyOrDateTime.dateOnly(value: "2019-06-16")
        let dateTime = SODateOnlyOrDateTime.dateTime(value: "2019-06-16T08:14:00-5000")
        
        let testObject = TestClass()
        testObject.multiple = [dateOnly, dateTime]
        
        let dictionary = try testObject.dictionary()
        XCTAssertEqual(dictionary.keys.count, 1)
        
        guard let multiple = dictionary["multiple"] as? [String] else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.first, "2019-06-16")
        XCTAssertEqual(multiple.last, "2019-06-16T13:14:00Z")
    }
}
