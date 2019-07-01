import XCTest
@testable import SOSwift

class ThingTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static let _additionalType = URL(string: "http://schema.org/MedicalEntity")
    public static let _alternativeName = "Pencil Pusher"
    public static let _description = "A cog in the machine."
    public static let _disambiguatingDescription = "An administrative pencil pusher."
    public static let _identifier = "1234567890"
    public static let _image = URL(string: "https://www.google.com/images/errors/robot.png")
    public static let _mainEntityOfPage = "Some Creative Work"
    public static let _name = "Bob's Hospital"
    public static let _potentialAction = "Go Go Gadget Arm"
    public static let _sameAs = URL(string: "https://www.facebook.com/bobshospital")
    public static let _url = URL(string: "http://www.bobshospital.com")
    
    public static var thing: Thing {
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
        return thing
    }
    
    func testSchema() throws {
        XCTAssertEqual(Thing.schemaType, "Thing")
    }
    
    func testDecode() throws {
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

        XCTAssertEqual(thing.additionalType, ThingTests._additionalType)
        XCTAssertEqual(thing.alternativeName, ThingTests._alternativeName)
        XCTAssertEqual(thing.description, ThingTests._description)
        XCTAssertEqual(thing.disambiguatingDescription, ThingTests._disambiguatingDescription)
        XCTAssertEqual(thing.identifier?.text, ThingTests._identifier)
        XCTAssertEqual(thing.image?.url, ThingTests._image)
        XCTAssertEqual(thing.mainEntityOfPage?.creativeWork?.name, ThingTests._mainEntityOfPage)
        XCTAssertEqual(thing.name, ThingTests._name)
        XCTAssertEqual(thing.potentialAction?.name, ThingTests._potentialAction)
        XCTAssertEqual(thing.sameAs, [ThingTests._sameAs!])
        XCTAssertEqual(thing.url, ThingTests._url)
        
        let json_idOnly = """
        {
            "@id": "\(ThingTests._identifier)"
        }
        """
        
        let thing_idOnly = try Thing.make(with: json_idOnly)
        
        XCTAssertEqual(thing_idOnly.identifier?.text, ThingTests._identifier)
    }
    
    func testEncode() throws {
        let dictionary = try ThingTests.thing.asDictionary()
        
        let id = dictionary[SchemaKeys.id.rawValue] as? String
        let type = dictionary[SchemaKeys.type.rawValue] as? String
        let context = dictionary[SchemaKeys.context.rawValue] as? String
        
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
        
        XCTAssertEqual(id, ThingTests._identifier)
        XCTAssertEqual(type, Thing.schemaType)
        XCTAssertEqual(context, Thing.schemaContext)
        
        XCTAssertEqual(additionalType, ThingTests._additionalType?.absoluteString)
        XCTAssertEqual(alternativeName, ThingTests._alternativeName)
        XCTAssertEqual(description, ThingTests._description)
        XCTAssertEqual(disambiguatingDescription, ThingTests._disambiguatingDescription)
        XCTAssertEqual(identifier, ThingTests._identifier)
        XCTAssertEqual(mainEntityOfPage?["name"] as? String, ThingTests._mainEntityOfPage)
        XCTAssertEqual(name, ThingTests._name)
        XCTAssertEqual(potentialAction?["name"] as? String, ThingTests._potentialAction)
        XCTAssertEqual(sameAs, [ThingTests._sameAs!.absoluteString])
        XCTAssertEqual(url, ThingTests._url?.absoluteString)
    }
}


