@testable import SOSwift
import XCTest

class IntegerOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var integer: IntegerOrText?
        var text: IntegerOrText?
    }

    func testDecode() throws {
        let json = """
        {
            "integer": 47,
            "text" : "Forty Seven"
        }
        """

        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.integer?.integer, 47)
        XCTAssertNil(testClass.integer?.text)
        XCTAssertEqual(testClass.text?.text, "Forty Seven")
        XCTAssertNil(testClass.text?.integer)
    }

    func testEncode() throws {
        let testClass = TestClass()
        testClass.integer = IntegerOrText(100)
        testClass.text = IntegerOrText("One Hundred")

        let dictionary = try testClass.asDictionary()
        XCTAssertEqual(dictionary["integer"] as? Int, 100)
        XCTAssertEqual(dictionary["text"] as? String, "One Hundred")
    }

    func testEquatability() throws {
        let t1 = IntegerOrText(10)
        let t2 = IntegerOrText(10)
        let t3 = IntegerOrText("Ten")

        XCTAssertEqual(t1, t2)
        XCTAssertNotEqual(t1, t3)
    }
}
