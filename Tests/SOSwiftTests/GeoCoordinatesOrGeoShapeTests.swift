import XCTest
@testable import SOSwift

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
        
        let geoCoordinates = (testObject.geoCoordinates as? GeoCoordinatesOrGeoShape)?.geoCoordinates
        XCTAssertEqual(geoCoordinates?.name, "Here")
        let geoShape = (testObject.geoShape as? GeoCoordinatesOrGeoShape)?.geoShape
        XCTAssertEqual(geoShape?.name, "There")
    }
    
    func testSingleEncodes() {
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
        
        let coordinates = (multiple[0] as? GeoCoordinatesOrGeoShape)?.geoCoordinates
        let shape = (multiple[1] as? GeoCoordinatesOrGeoShape)?.geoShape
        
        XCTAssertEqual(coordinates?.name, "Here")
        XCTAssertEqual(shape?.name, "There")
    }
    
    func testMultipleEncodes() throws {
        let coordinates = GeoCoordinates()
        coordinates.postalCode = "12345"
        
        let shape = GeoShape()
        shape.postalCode = "54321"
        
        var multiple = [GeoCoordinatesOrGeoShape]()
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

