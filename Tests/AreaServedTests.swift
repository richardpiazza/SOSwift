import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class AreaServedTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var administrativeArea: AreaServed?
        var geoShape: AreaServed?
        var place: AreaServed?
        var text: AreaServed?
        
        private enum CodingKeys: String, CodingKey {
            case administrativeArea
            case geoShape
            case place
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.administrativeArea = try container.decodeAreaServedIfPresent(forKey: .administrativeArea)
            self.geoShape = try container.decodeAreaServedIfPresent(forKey: .geoShape)
            self.place = try container.decodeAreaServedIfPresent(forKey: .place)
            self.text = try container.decodeAreaServedIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.administrativeArea, forKey: .administrativeArea)
            try container.encodeIfPresent(self.geoShape, forKey: .geoShape)
            try container.encodeIfPresent(self.place, forKey: .place)
            try container.encodeIfPresent(self.text, forKey: .text)
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
        XCTAssertTrue(testable.administrativeArea! is SOAdministrativeArea)
        XCTAssertNotNil(testable.geoShape)
        XCTAssertTrue(testable.geoShape! is SOGeoShape)
        XCTAssertNotNil(testable.place)
        XCTAssertTrue(testable.place! is SOPlace)
        XCTAssertNotNil(testable.text)
        XCTAssertTrue(testable.text! is String)
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let administrativeArea = SOAdministrativeArea()
        administrativeArea.name = "Area 1"
        testObject.administrativeArea = administrativeArea
        
        let geoShape = SOGeoShape()
        geoShape.name = "Area 2"
        testObject.geoShape = geoShape
        
        let place = SOPlace()
        place.name = "Area 3"
        testObject.place = place
        
        testObject.text = "Area 4"
        
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
