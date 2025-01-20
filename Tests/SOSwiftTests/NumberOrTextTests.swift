@testable import SOSwift
import XCTest

class NumberOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var number: NumberOrText?
        var text: NumberOrText?
    }

    func testDecode() throws {
        let json = """
        {
            "number" : 47,
            "text" : "LCARS"
        }
        """

        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.number?.number?.integer, 47)
        XCTAssertNil(testClass.number?.number?.floatingPoint)
        XCTAssertNil(testClass.number?.text)
        XCTAssertEqual(testClass.text?.text, "LCARS")
        XCTAssertNil(testClass.text?.number)
    }

    func testEncode() throws {
        let testClass = TestClass()
        testClass.number = NumberOrText(.floatingPoint(value: 4.7))
        testClass.text = NumberOrText("Almost Five")

        let dictionary = try testClass.asDictionary()
        XCTAssertEqual(dictionary["number"] as? Double, 4.7)
        XCTAssertEqual(dictionary["text"] as? String, "Almost Five")
    }

    func testEquatability() throws {
        let t1 = NumberOrText(Number(10))
        let t2 = NumberOrText(Number(10))
        let t3 = NumberOrText("Ten")

        XCTAssertEqual(t1, t2)
        XCTAssertNotEqual(t1, t3)
    }
}
