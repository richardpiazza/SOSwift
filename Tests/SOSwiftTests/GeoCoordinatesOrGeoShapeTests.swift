import XCTest
@testable import SOSwift

class GeoCoordinatesOrGeoShapeTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var geoCoordinates: GeoCoordinatesOrGeoShape?
        var geoShape: GeoCoordinatesOrGeoShape?
        var multiple: [GeoCoordinatesOrGeoShape]?
    }
    
    func testDecode() throws {
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
        
        let geoCoordinates = (testObject.geoCoordinates as? GeoCoordinatesOrGeoShape)?.geoCoordinates
        XCTAssertEqual(geoCoordinates?.name, "Here")
        let geoShape = (testObject.geoShape as? GeoCoordinatesOrGeoShape)?.geoShape
        XCTAssertEqual(geoShape?.name, "There")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let geoCoordinates = GeoCoordinates()
        geoCoordinates.name = "Home"
        testObject.geoCoordinates = .geoCoordinates(value: geoCoordinates)
        
        let geoShape = GeoShape()
        geoShape.name = "Work"
        testObject.geoShape = .geoShape(value: geoShape)
        
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
    
    func testEquatability() throws {
        
    }
}

