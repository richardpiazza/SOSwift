@testable import SOSwift
import XCTest

class AreaServedTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var administrativeArea: AreaServed?
        var geoShape: AreaServed?
        var place: AreaServed?
        var text: AreaServed?
    }

    func testDecode() throws {
        let json = """
        {
            "administrativeArea" : {
                "@type" : "AdministrativeArea",
                "name" : "Administrative Area"
            },
            "geoShape" : {
                "@type" : "GeoShape",
                "name" : "Geo Shape"
            },
            "place" : {
                "@type" : "Place",
                "name" : "Place"
            },
            "text" : "String"
        }
        """

        let testClass = try TestClass.make(with: json)

        XCTAssertEqual(testClass.administrativeArea?.administrativeArea?.name, "Administrative Area")
        XCTAssertNil(testClass.administrativeArea?.geoShape)
        XCTAssertNil(testClass.administrativeArea?.place)
        XCTAssertNil(testClass.administrativeArea?.text)

        XCTAssertEqual(testClass.geoShape?.geoShape?.name, "Geo Shape")
        XCTAssertNil(testClass.geoShape?.administrativeArea)
        XCTAssertNil(testClass.geoShape?.place)
        XCTAssertNil(testClass.geoShape?.text)

        XCTAssertEqual(testClass.place?.place?.name, "Place")
        XCTAssertNil(testClass.place?.administrativeArea)
        XCTAssertNil(testClass.place?.geoShape)
        XCTAssertNil(testClass.place?.text)

        XCTAssertEqual(testClass.text?.text, "String")
        XCTAssertNil(testClass.text?.administrativeArea)
        XCTAssertNil(testClass.text?.geoShape)
        XCTAssertNil(testClass.text?.place)
    }

    func testEncode() throws {
        let administrativeArea = AdministrativeArea()
        administrativeArea.name = "Area 1"

        let geoShape = GeoShape()
        geoShape.name = "Area 2"

        let place = Place()
        place.name = "Area 3"

        let testClass = TestClass()
        testClass.administrativeArea = AreaServed(administrativeArea)
        testClass.geoShape = AreaServed(geoShape)
        testClass.place = AreaServed(place)
        testClass.text = AreaServed("Area 4")

        let dictionary = try testClass.asDictionary()

        let a1 = dictionary["administrativeArea"] as? [String: Any]
        let a2 = dictionary["geoShape"] as? [String: Any]
        let a3 = dictionary["place"] as? [String: Any]
        let a4 = dictionary["text"] as? String

        XCTAssertEqual(a1?["name"] as? String, "Area 1")
        XCTAssertEqual(a2?["name"] as? String, "Area 2")
        XCTAssertEqual(a3?["name"] as? String, "Area 3")
        XCTAssertEqual(a4, "Area 4")
    }
}
