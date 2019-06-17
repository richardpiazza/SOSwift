import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class GeoCoordinatesOrGeoShapeTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var geoCoordinates: GeoCoordinatesOrGeoShape?
        var geoShape: GeoCoordinatesOrGeoShape?
        var multiple: [GeoCoordinatesOrGeoShape]?
        
        private enum CodingKeys: String, CodingKey {
            case geoCoordinates
            case geoShape
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.geoCoordinates = try container.decodeGeoCoordinatesOrGeoShapeIfPresent(forKey: .geoCoordinates)
            self.geoShape = try container.decodeGeoCoordinatesOrGeoShapeIfPresent(forKey: .geoShape)
            self.multiple = try container.decodeGeoCoordinatesOrGeoShapesIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.geoCoordinates, forKey: .geoCoordinates)
            try container.encodeIfPresent(self.geoShape, forKey: .geoShape)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
    }
    
    func testSingleDecodes() throws {
        let json = """
            {
                "geoCoordinates" : {
                    "@type" : "GeoCoordinates",
                    "name" : "Here"
                },
                "geoShape" : {
                    "@type" : "GeoShape",
                    "name" : "There"
                }
            }
        """
        
        let testObject = try TestClass.make(with: json)
        
        let geoCoordinates = (testObject.geoCoordinates as? SOGeoCoordinatesOrGeoShape)?.geoCoordinates
        XCTAssertEqual(geoCoordinates?.name, "Here")
        let geoShape = (testObject.geoShape as? SOGeoCoordinatesOrGeoShape)?.geoShape
        XCTAssertEqual(geoShape?.name, "There")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let geoCoordinates = SOGeoCoordinates()
        geoCoordinates.name = "Home"
        testObject.geoCoordinates = geoCoordinates
        
        let geoShape = SOGeoShape()
        geoShape.name = "Work"
        testObject.geoShape = geoShape
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let gc = dictionary["geoCoordinates"] as? [String : Any], let gcName = gc["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(gcName, "Home")
        
        guard let gs = dictionary["geoShape"] as? [String : Any], let gsName = gs["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(gsName, "Work")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "GeoCoordinates",
                    "name" : "Here"
                },
                {
                    "@type" : "GeoShape",
                    "name" : "There"
                }
            ]
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        guard let multiple = testObject.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        let coordinates = (multiple[0] as? SOGeoCoordinatesOrGeoShape)?.geoCoordinates
        let shape = (multiple[1] as? SOGeoCoordinatesOrGeoShape)?.geoShape
        
        XCTAssertEqual(coordinates?.name, "Here")
        XCTAssertEqual(shape?.name, "There")
    }
    
    func testMultipleEncodes() throws {
        let coordinates = SOGeoCoordinates()
        coordinates.postalCode = "12345"
        
        let shape = SOGeoShape()
        shape.postalCode = "54321"
        
        var multiple = [SOGeoCoordinatesOrGeoShape]()
        multiple.append(.geoCoordinates(value: coordinates))
        multiple.append(.geoShape(value: shape))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.dictionary()
        XCTAssertEqual(dictionary.keys.count, 1)
        
        guard let value = dictionary["multiple"] as? [[String : Any]] else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(value[0]["postalCode"] as? String, "12345")
        XCTAssertEqual(value[1]["postalCode"] as? String, "54321")
    }
}

