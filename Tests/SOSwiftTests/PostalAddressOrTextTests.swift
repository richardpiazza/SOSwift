@testable import SOSwift
import XCTest

class PostalAddressOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var postalAddress: PostalAddressOrText?
        var text: PostalAddressOrText?
    }

    func testDecode() throws {
        let json = """
        {
            "postalAddress" : {
                "@type" : "PostalAddress",
                "name" : "Infinite Loop"
            },
            "text" : "Apple Campus"
        }
        """

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.postalAddress?.postalAddress?.name, "Infinite Loop")
        XCTAssertEqual(testObject.text?.text, "Apple Campus")
    }

    func testEncode() throws {
        let testObject = TestClass()

        let postalAddress = PostalAddress()
        postalAddress.name = "The Googleplex"
        testObject.postalAddress = .postalAddress(value: postalAddress)

        testObject.text = .text(value: "Google Campus")

        let dictionary: [String: Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }

        guard let pa = dictionary["postalAddress"] as? [String: Any], let paName = pa["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(paName, "The Googleplex")

        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(t, "Google Campus")
    }

    func testEquatability() throws {}
}
