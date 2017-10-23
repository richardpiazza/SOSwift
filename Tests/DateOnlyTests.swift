import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class DateOnlyTests: XCTestCase {

    class DateOnlyContainer: Codable {
        var date: DateOnly?
        
        private enum CodingKeys: String, CodingKey {
            case date
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let value = try container.decodeDateOnlyIfPresent(forKey: .date) {
                self.date = value
            }
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.date, forKey: .date)
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

    func testDateOnly() {
        let json = """
            {
                "date" : "2017-10-18"
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var testable: DateOnlyContainer
        
        do {
            testable = try JSONDecoder().decode(DateOnlyContainer.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        guard let date = testable.date?.dateOnly else {
            XCTFail()
            return
        }
        
        let components = DateComponents(calendar: Calendar.current, timeZone: TimeZone(secondsFromGMT: 0), era: nil, year: 2017, month: 10, day: 18, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        guard let componentsDate = components.date else {
            XCTFail()
            return
        }
        
        let compare = Calendar.current.compare(date, to: componentsDate, toGranularity: .day)
        XCTAssertEqual(compare, .orderedSame)
    }

    func testInvalidDateOnly() {
        let json = """
            {
                "date" : "invalid"
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var testable: DateOnlyContainer
        
        do {
            testable = try JSONDecoder().decode(DateOnlyContainer.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        XCTAssertNil(testable.date?.dateOnly)
    }
    
    func testInvalidDateOnly2() {
        let json = """
            {
                "date" : 42
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var testable: DateOnlyContainer
        
        do {
            testable = try JSONDecoder().decode(DateOnlyContainer.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        XCTAssertNil(testable.date?.dateOnly)
    }
    
    func testInvalidDateOnly3() {
        let json = """
            {
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var testable: DateOnlyContainer
        
        do {
            testable = try JSONDecoder().decode(DateOnlyContainer.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        XCTAssertNil(testable.date?.dateOnly)
    }
}
