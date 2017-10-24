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
    
    func testSingleDecode() {
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
}
