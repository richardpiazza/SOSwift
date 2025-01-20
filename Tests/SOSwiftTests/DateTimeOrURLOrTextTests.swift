@testable import SOSwift
import XCTest

class DateTimeOrURLOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var dateTime: DateTimeOrURLOrText?
        var text: DateTimeOrURLOrText?
        var url: DateTimeOrURLOrText?
    }

    private var dateComponents: DateComponents {
        DateComponents(calendar: Calendar.current, timeZone: TimeZone(secondsFromGMT: 21600), era: nil, year: 2017, month: 10, day: 26, hour: 8, minute: 13, second: 0, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }

    private var dateString: String {
        "2017-10-26T02:13:00Z"
    }

    func testDecode() throws {
        let json = """
        {
            "dateTime" : "2017-10-26T08:13:00+6000",
            "text" : "Hello World",
            "url" : "https://www.google.com"
        }
        """

        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.dateTime?.dateTime?.rawValue, dateComponents.date)
        XCTAssertNil(testClass.dateTime?.url)
        XCTAssertNil(testClass.dateTime?.text)
        XCTAssertEqual(testClass.text?.text, "Hello World")
        XCTAssertNil(testClass.text?.dateTime)
        XCTAssertNil(testClass.text?.url)
        XCTAssertEqual(testClass.url?.url?.host, "www.google.com")
        XCTAssertNil(testClass.url?.dateTime)
        XCTAssertNil(testClass.url?.text)
    }

    func testEncode() throws {
        let testObject = TestClass()
        testObject.dateTime = DateTimeOrURLOrText(DateTime(rawValue: dateComponents.date!))
        testObject.text = DateTimeOrURLOrText("Goodbye")
        testObject.url = DateTimeOrURLOrText(URL(string: "https://www.apple.com")!)

        let dictionary = try testObject.asDictionary()
        XCTAssertEqual(dictionary["dateTime"] as? String, dateString)
        XCTAssertEqual(dictionary["text"] as? String, "Goodbye")
        XCTAssertEqual(dictionary["url"] as? String, "https://www.apple.com")
    }

    func testEquatability() throws {
        let date = Date()

        let t1 = DateTimeOrURLOrText(DateTime(rawValue: date))
        let t2 = DateTimeOrURLOrText(DateTime(rawValue: date))
        let t3 = DateTimeOrURLOrText(URL(string: "https://www.google.com")!)
        let t4 = DateTimeOrURLOrText(URL(string: "https://www.google.com")!)
        let t5 = DateTimeOrURLOrText("Words")
        let t6 = DateTimeOrURLOrText("Words")

        XCTAssertEqual(t1, t2)
        XCTAssertNotEqual(t1, t3)
        XCTAssertNotEqual(t2, t5)
        XCTAssertEqual(t3, t4)
        XCTAssertNotEqual(t3, t2)
        XCTAssertNotEqual(t4, t5)
        XCTAssertEqual(t5, t6)
        XCTAssertNotEqual(t4, t6)
    }
}
