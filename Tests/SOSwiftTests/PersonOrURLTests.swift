@testable import SOSwift
import XCTest

class PersonOrURLTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var person: PersonOrURL?
        var url: PersonOrURL?
    }

    func testDecode() throws {
        let json = """
        {
            "person" : {
                "@type" : "Person",
                "name" : "Richard"
            },
            "url" : "https://www.richardpiazza.com"
        }
        """

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.person?.person?.name, "Richard")
        XCTAssertEqual(testObject.url?.url?.host, "www.richardpiazza.com")
    }

    func testEncode() throws {
        let testObject = TestClass()

        let person = Person()
        person.name = "Jon Snow"
        testObject.person = .person(value: person)

        testObject.url = .url(value: URL(string: "https://en.wikipedia.org/wiki/Jon_Snow_(character)")!)

        let dictionary: [String: Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }

        guard let p = dictionary["person"] as? [String: Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(pName, "Jon Snow")

        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }

        XCTAssertEqual(url.host, "en.wikipedia.org")
    }

    func testEquatability() throws {}
}
