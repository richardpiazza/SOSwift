import XCTest
@testable import SOSwift

class SOThingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// Test `SOThing`
    func testSOThing() {
        var json = "{"
        json.append("\"additionalType\":\"http://schema.org/MedicalEntity\"")
        json.append(",\"alternativeName\":\"Pencil Pusher\"")
        json.append(",\"description\":\"A cog in the machine.\"")
        json.append(",\"disambiguatingDescription\":\"An administrative pencil pusher.\"")
        json.append(",\"identifier\":\"1234567890\"")
        json.append(",\"image\":\"https://www.google.com/logo.png\"")
        json.append(",\"mainEntityOfPage\":{")
        json.append("\"@type\":\"CreativeWork\"")
        json.append(",\"name\":\"Some Creative Work\"")
        json.append("}")
        json.append(",\"name\":\"Bobs Hospital\"")
        json.append(",\"potentialAction\":{")
        json.append("\"@type\":\"Action\"")
        json.append(",\"name\":\"Go Go Gadget Arm\"")
        json.append("}")
        json.append(",\"sameAs\":[")
        json.append("\"https://www.facebook.com/bobshospital\"")
        json.append("]")
        json.append(",\"url\":\"http://www.bobshospital.com\"")
        json.append("}")
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var thing: SOThing
        
        do {
            thing = try JSONDecoder().decode(SOThing.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        XCTAssertNotNil(thing.additionalType)
        XCTAssertTrue(thing.additionalType == URL(string: "http://schema.org/MedicalEntity"))
        
        XCTAssertNotNil(thing.alternativeName)
        XCTAssertTrue(thing.alternativeName == "Pencil Pusher")
        
        XCTAssertNotNil(thing.description)
        XCTAssertTrue(thing.description == "A cog in the machine.")
    }
}
