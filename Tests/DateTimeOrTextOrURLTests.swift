import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class DateTimeOrTextOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var dateTime: DateTimeOrTextOrURL?
        var text: DateTimeOrTextOrURL?
        var url: DateTimeOrTextOrURL?
        
        private enum CodingKeys: String, CodingKey {
            case dateTime
            case text
            case url
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.dateTime = try container.decodeDateTimeOrTextOrURLIfPresent(forKey: .dateTime)
            self.text = try container.decodeDateTimeOrTextOrURLIfPresent(forKey: .text)
            self.url = try container.decodeDateTimeOrTextOrURLIfPresent(forKey: .url)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.dateTime, forKey: .dateTime)
            try container.encodeIfPresent(self.text, forKey: .text)
            try container.encodeIfPresent(self.url, forKey: .url)
        }
    }
    
    var dateComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone(secondsFromGMT: 21600), era: nil, year: 2017, month: 10, day: 26, hour: 8, minute: 13, second: 0, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    var dateString: String {
        return "2017-10-26T02:13:00Z"
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
                "dateTime" : "2017-10-26T08:13:00+6000",
                "text" : "Hello World",
                "url" : "https://www.google.com"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let dateTime = testObject.dateTime as? DateTime else {
            XCTFail()
            return
        }
        
        let dtDate = dateTime.date
        let dcDate = dateComponents.date
        
        XCTAssertEqual(dtDate, dcDate)
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Hello World")
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.google.com")
    }

    func testSingleEncodes() {
        let testObject = TestClass()
        testObject.dateTime = dateComponents.date?.dateTime
        testObject.text = "Goodbye"
        testObject.url = URL(string: "https://www.apple.com")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let dt = dictionary["dateTime"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(dt, dateString)
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Goodbye")
        
        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.apple.com")
    }
}
