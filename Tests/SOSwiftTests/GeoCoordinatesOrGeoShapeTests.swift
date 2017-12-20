import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class GeoCoordinatesOrGeoShapeTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var geoCoordinates: GeoCoordinatesOrGeoShape?
        var geoShape: GeoCoordinatesOrGeoShape?
        
        private enum CodingKeys: String, CodingKey {
            case geoCoordinates
            case geoShape
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.geoCoordinates = try container.decodeGeoCoordinatesOrGeoShapeIfPresent(forKey: .geoCoordinates)
            self.geoShape = try container.decodeGeoCoordinatesOrGeoShapeIfPresent(forKey: .geoShape)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.geoCoordinates, forKey: .geoCoordinates)
            try container.encodeIfPresent(self.geoShape, forKey: .geoShape)
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSingleDecodes() {
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
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let geoCoordinates = testObject.geoCoordinates as? GeoCoordinates else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(geoCoordinates.name, "Here")
        
        guard let geoShape = testObject.geoShape as? GeoShape else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(geoShape.name, "There")
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
}

