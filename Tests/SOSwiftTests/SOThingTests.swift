import XCTest
@testable import SOSwift

class ThingTests: XCTestCase {
    
    static var allTests = [
        ("testThingEncodeContextAndType", testThingEncodeContextAndType)
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThing() {
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

        var thing: Thing

        do {
            thing = try JSONDecoder().decode(Thing.self, from: data)
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
        XCTAssertNotNil(thing.disambiguatingDescription)
        XCTAssertNotNil(thing.identifier)
        XCTAssertNotNil(thing.image)
        XCTAssertNotNil(thing.mainEntityOfPage)
        XCTAssertNotNil(thing.name)
        XCTAssertNotNil(thing.potentialAction)
        XCTAssertNotNil(thing.sameAs)
        XCTAssertNotNil(thing.url)
    }
    
    func testThingEncodeContextAndType() {
        let thing = Thing()
        let data: Data
        do {
            data = try JSONEncoder().encode(thing)
        } catch {
            XCTFail()
            return
        }
        
        let dictionary: [String : Any]
        do {
            dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [String : Any]
        } catch {
            XCTFail()
            return
        }
        
        guard let type = dictionary["@type"] as? String else {
            XCTFail()
            return
        }
        
        guard let context = dictionary["@context"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(type, "Thing")
        XCTAssertEqual(context, "http://www.schema.org")
    }
}
