import XCTest
@testable import SOSwift

class ThingTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testSingleDecode", testSingleDecode),
        ("testSingleEncode", testSingleEncode),
    ]
    
    func testSchema() throws {
        XCTAssertEqual(Thing.schemaType, "Thing")
    }
    
    func testSingleDecode() throws {
        let json = """
            {
                "additionalType" : "http://schema.org/MedicalEntity",
                "alternativeName" : "Pencil Pusher",
                "description" : "A cog in the machine.",
                "disambiguatingDescription" : "An administrative pencil pusher.",
                "@id" : "0987654321",
                "identifier" : "1234567890",
                "image" : "https://www.google.com/images/errors/robot.png",
                "mainEntityOfPage" : {
                    "@type" : "CreativeWork",
                    "name" : "Some Creative Work"
                },
                "name" : "Bob's Hospital",
                "potentialAction" : {
                    "@type" : "Action",
                    "name" : "Go Go Gadget Arm"
                },
                "sameAs" : [
                    "https://www.facebook.com/bobshospital"
                ],
                "url" : "http://www.bobshospital.com"
            }
        """

        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }

        let thing = try JSONDecoder().decode(Thing.self, from: data)

        XCTAssertEqual(thing.additionalType, URL(string: "http://schema.org/MedicalEntity"))
        
        XCTAssertNotNil(thing.alternativeName)
        XCTAssertTrue(thing.alternativeName == "Pencil Pusher")
        XCTAssertNotNil(thing.description)
        XCTAssertTrue(thing.description == "A cog in the machine.")
        XCTAssertNotNil(thing.disambiguatingDescription)
        XCTAssertNotNil(thing.identifier)
        XCTAssertNotNil(thing.image)
        XCTAssertNotNil(thing.mainEntityOfPage)
        XCTAssertNotNil(thing.name)
        XCTAssertNotNil(thing.potentialAction)
        XCTAssertNotNil(thing.sameAs)
        XCTAssertNotNil(thing.url)
    }
    
    func testSingleEncode() throws {
        let thing = Thing()
        thing.identifier = .text(value: "1234567890")
        
        let data = try JSONEncoder().encode(thing)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [String : Any]
        
        let id = dictionary["@id"] as? String
        let type = dictionary["@type"] as? String
        let context = dictionary["@context"] as? String
        let identifier = dictionary["identifier"] as? String
        
        XCTAssertEqual(id, "1234567890")
        XCTAssertEqual(type, "Thing")
        XCTAssertEqual(context, "http://www.schema.org")
        XCTAssertEqual(identifier, "1234567890")
    }
}
