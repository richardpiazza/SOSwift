import XCTest
@testable import SOSwift

class ThingTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testSingleDecode", testSingleDecode),
        ("testSingleEncode", testSingleEncode),
    ]
    
    private let _additionalType = URL(string: "http://schema.org/MedicalEntity")
    private let _alternativeName = "Pencil Pusher"
    private let _description = "A cog in the machine."
    private let _disambiguatingDescription = "An administrative pencil pusher."
    private let _identifier = "1234567890"
    private let _image = URL(string: "https://www.google.com/images/errors/robot.png")
    private let _mainEntityOfPage = "Some Creative Work"
    private let _name = "Bob's Hospital"
    private let _potentialAction = "Go Go Gadget Arm"
    private let _sameAs = URL(string: "https://www.facebook.com/bobshospital")
    private let _url = URL(string: "http://www.bobshospital.com")
    
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
        
        let thing = try Thing.make(with: json)

        XCTAssertEqual(thing.additionalType, _additionalType)
        XCTAssertEqual(thing.alternativeName, _alternativeName)
        XCTAssertEqual(thing.description, _description)
        XCTAssertEqual(thing.disambiguatingDescription, _disambiguatingDescription)
        XCTAssertEqual(thing.identifier?.text, _identifier)
        XCTAssertEqual(thing.image?.url, _image)
        XCTAssertEqual(thing.mainEntityOfPage?.creativeWork?.name, _mainEntityOfPage)
        XCTAssertEqual(thing.name, _name)
        XCTAssertEqual(thing.potentialAction?.name, _potentialAction)
        XCTAssertEqual(thing.sameAs, [_sameAs!])
        XCTAssertEqual(thing.url, _url)
        
        let json_idOnly = """
        {
            "@id": "\(_identifier)"
        }
        """
        
        let thing_idOnly = try Thing.make(with: json_idOnly)
        
        XCTAssertEqual(thing_idOnly.identifier?.text, _identifier)
    }
    
    func testSingleEncode() throws {
        let thing = Thing()
        thing.additionalType = _additionalType
        thing.alternativeName = _alternativeName
        thing.description = _description
        thing.disambiguatingDescription = _disambiguatingDescription
        thing.identifier = .text(value: _identifier)
        thing.mainEntityOfPage = .creativeWork(value: CreativeWork(name: _mainEntityOfPage))
        thing.name = _name
        thing.potentialAction = Action(name: _potentialAction)
        thing.sameAs = [_sameAs!]
        thing.url = _url
        
        let data = try JSONEncoder().encode(thing)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [String : Any]
        
        let id = dictionary["@id"] as? String
        let type = dictionary["@type"] as? String
        let context = dictionary["@context"] as? String
        
        let additionalType = dictionary[Thing.CodingKeys.additionalType] as? String
        let alternativeName = dictionary[Thing.CodingKeys.alternativeName] as? String
        let description = dictionary[Thing.CodingKeys.description] as? String
        let disambiguatingDescription = dictionary[Thing.CodingKeys.disambiguatingDescription] as? String
        let identifier = dictionary[Thing.CodingKeys.identifier] as? String
        let mainEntityOfPage = dictionary[Thing.CodingKeys.mainEntityOfPage] as? [String : Any]
        let name = dictionary[Thing.CodingKeys.name] as? String
        let potentialAction = dictionary[Thing.CodingKeys.potentialAction] as? [String : Any]
        let sameAs = dictionary[Thing.CodingKeys.sameAs] as? [String]
        let url = dictionary[Thing.CodingKeys.url] as? String
        
        XCTAssertEqual(id, "1234567890")
        XCTAssertEqual(type, "Thing")
        XCTAssertEqual(context, "http://www.schema.org")
        
        XCTAssertEqual(additionalType, _additionalType?.absoluteString)
        XCTAssertEqual(alternativeName, _alternativeName)
        XCTAssertEqual(description, _description)
        XCTAssertEqual(disambiguatingDescription, _disambiguatingDescription)
        XCTAssertEqual(identifier, _identifier)
        XCTAssertEqual(mainEntityOfPage?["name"] as? String, _mainEntityOfPage)
        XCTAssertEqual(name, _name)
        XCTAssertEqual(potentialAction?["name"] as? String, _potentialAction)
        XCTAssertEqual(sameAs, [_sameAs!.absoluteString])
        XCTAssertEqual(url, _url?.absoluteString)
    }
}


