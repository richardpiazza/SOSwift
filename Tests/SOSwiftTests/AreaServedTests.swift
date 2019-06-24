import XCTest
@testable import SOSwift

class AreaServedTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var administrativeArea: AreaServed?
        var geoShape: AreaServed?
        var place: AreaServed?
        var text: AreaServed?
    }
    
    func testSingleDecodes() {
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
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable: TestClass
        do {
            testable = try JSONDecoder().decode(TestClass.self, from: data)
        } catch {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(testable.administrativeArea)
        XCTAssertNotNil(testable.geoShape)
        XCTAssertNotNil(testable.place)
        XCTAssertNotNil(testable.text)
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let administrativeArea = AdministrativeArea()
        administrativeArea.name = "Area 1"
        testObject.administrativeArea = .administrativeArea(value: administrativeArea)
        
        let geoShape = GeoShape()
        geoShape.name = "Area 2"
        testObject.geoShape = .geoShape(value: geoShape)
        
        let place = Place()
        place.name = "Area 3"
        testObject.place = .place(value: place)
        
        testObject.text = .text(value: "Area 4")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let aa = dictionary["administrativeArea"] as? [String : Any], let aaName = aa["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(aaName, "Area 1")
        
        guard let gs = dictionary["geoShape"] as? [String : Any], let gsName = gs["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(gsName, "Area 2")
        
        guard let p = dictionary["place"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Area 3")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Area 4")
    }
}
