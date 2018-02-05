import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class TimeTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var time: Time?
        
        private enum CodingKeys: String, CodingKey {
            case time
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.time = try container.decodeTimeIfPresent(forKey: .time)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.time, forKey: .time)
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
        
        testObject.time = dateComponents.date?.time
        
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