import XCTest
@testable import SOSwift

class AudienceTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static let _audienceType = "Programmers"
    public static let _geographicArea = "5ft of a computer"
    
    public static var audience: Audience {
        let audience = Audience()
        audience.audienceType = _audienceType
        
        let geographicArea = AdministrativeArea()
        geographicArea.name = _geographicArea
        audience.geographicArea = geographicArea
        
        return audience
    }
    
    func testSchema() throws {
        XCTAssertEqual(Audience.schemaType, "Audience")
    }
    
    func testDecode() throws {
        let json = """
        {
            "audienceType": "All",
            "geographicArea": {
                "name": "Here"
            }
        }
        """
        
        let audience = try Audience.make(with: json)
        
        XCTAssertEqual(audience.audienceType, "All")
        XCTAssertEqual(audience.geographicArea?.name, "Here")
    }
    
    func testEncode() throws {
        let dictionary = try AudienceTests.audience.asDictionary()
        
        let audienceType = dictionary[Audience.AudienceCodingKeys.audienceType.rawValue] as? String
        let geographicArea = dictionary[Audience.AudienceCodingKeys.geographicArea.rawValue] as? [String : Any]

        XCTAssertEqual(audienceType, AudienceTests._audienceType)
        XCTAssertEqual(geographicArea?["name"] as? String, AudienceTests._geographicArea)
    }
    
}
