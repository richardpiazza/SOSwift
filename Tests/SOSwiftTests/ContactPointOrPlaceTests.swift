@testable import SOSwift
import XCTest

class ContactPointOrPlaceTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var contactPoint: ContactPointOrPlace?
        var place: ContactPointOrPlace?
        var multiple: [ContactPointOrPlace]?
    }

    func testSingleDecodes() throws {
        let json = """
            {
                "contactPoint" : {
                    "@type" : "ContactPoint",
                    "name" : "Contact Point"
                },
                "place" : {
                    "@type" : "Place",
                    "name" : "A Place"
                }
            }
        """

        let testObject = try TestClass.make(with: json)

        let contactPoint = testObject.contactPoint?.contactPoint
        XCTAssertEqual(contactPoint?.name, "Contact Point")

        let place = testObject.place?.place
        XCTAssertEqual(place?.name, "A Place")
    }

    func testSingleEncodes() throws {
        let testObject = TestClass()

        let contactPoint = ContactPoint()
        contactPoint.name = "Alpha"

        let place = Place()
        place.name = "Beta"

        testObject.contactPoint = .contactPoint(value: contactPoint)
        testObject.place = .place(value: place)

        let json: String
        do {
            json = try testObject.asJSON()
        } catch {
            XCTFail()
            return
        }

        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }

        let dictionary: [String: Any]
        do {
            guard let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String: Any] else {
                XCTFail()
                return
            }

            dictionary = dict
        } catch {
            XCTFail()
            return
        }

        guard let cp = dictionary["contactPoint"] as? [String: Any], let alpha = cp["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(alpha, "Alpha")

        guard let p = dictionary["place"] as? [String: Any], let beta = p["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(beta, "Beta")
    }

    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type": "ContactPoint",
                    "name": "CP Item"
                },
                {
                    "@type": "Place",
                    "name": "P Item"
                }
            ]
        }
        """

        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }

        let testable: TestClass = try JSONDecoder().decode(TestClass.self, from: data)

        guard let multiple = testable.multiple else {
            XCTFail()
            return
        }

        XCTAssertEqual(multiple.count, 2)

        let contactPoint = multiple[0]
        XCTAssertEqual(contactPoint.contactPoint?.name, "CP Item")

        let place = multiple[1]
        XCTAssertEqual(place.place?.name, "P Item")
    }

    func testMultipleEncodes() throws {
        let testable = TestClass()
        testable.multiple = [.contactPoint(value: ContactPoint()), .place(value: Place())]

        let json = try testable.asJSON()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
