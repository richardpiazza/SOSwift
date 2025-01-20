@testable import SOSwift
import XCTest

class MusicGroupOrPersonTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var musicGroup: MusicGroupOrPerson?
        var person: MusicGroupOrPerson?
    }

    func testDecode() throws {
        let json = """
        {
            "musicGroup" : {
                "@type" : "MusicGroup",
                "name" : "Young Beautiful in a Hurry"
            },
            "person" : {
                "@type" : "Person",
                "name" : "Brendan McCreary"
            }
        }
        """

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.musicGroup?.musicGroup?.name, "Young Beautiful in a Hurry")
        XCTAssertEqual(testObject.person?.person?.name, "Brendan McCreary")
    }

    func testEncode() throws {
        let testObject = TestClass()

        let musicGroup = MusicGroup()
        musicGroup.name = "The Beatles"
        testObject.musicGroup = .musicGroup(value: musicGroup)

        let person = Person()
        person.name = "Paul McCartney"
        testObject.person = .person(value: person)

        let dictionary = try testObject.asDictionary()

        guard let mg = dictionary["musicGroup"] as? [String: Any], let mgName = mg["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(mgName, "The Beatles")

        guard let p = dictionary["person"] as? [String: Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(pName, "Paul McCartney")
    }

    func testEquatability() throws {}
}
