import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class AreaServedTests: XCTestCase {
    
    fileprivate class Testable: Codable {
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
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let value = try container.decodeAreaServedIfPresent(forKey: .administrativeArea) {
                self.administrativeArea = value
            }
            if let value = try container.decodeAreaServedIfPresent(forKey: .geoShape) {
                self.geoShape = value
            }
            if let value = try container.decodeAreaServedIfPresent(forKey: .place) {
                self.place = value
            }
            if let value = try container.decodeAreaServedIfPresent(forKey: .text) {
                self.text = value
            }
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if let value = self.administrativeArea {
                try container.encodeAreaServed(value, forKey: .administrativeArea)
            }
            if let value = self.geoShape {
                try container.encodeAreaServed(value, forKey: .geoShape)
            }
            if let value = self.place {
                try container.encodeAreaServed(value, forKey: .place)
            }
            if let value = self.text {
                try container.encodeAreaServed(value, forKey: .text)
            }
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
        
        let testable: Testable
        do {
            testable = try JSONDecoder().decode(Testable.self, from: data)
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
