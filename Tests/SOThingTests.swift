import XCTest
@testable import SOSwift

class SOThingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
//    func testSOThing() {
//        let json = """
//            {
//                "additionalType" : "http://schema.org/MedicalEntity",
//                "alternativeName" : "Pencil Pusher",
//                "description" : "A cog in the machine.",
//                "disambiguatingDesccription" : "An administrative pencil pusher.",
//                "identifier" : "1234567890",
//                "mainEntityOfPage" : {
//                    "@type" : "CreativeWork",
//                    "name" : "Some Creative Work"
//                },
//                "name" : "Bob's Hospital",
//                "potentialAction" : {
//                    "@type" : "Action",
//                    "name" : "Go Go Gadget Arm"
//                },
//                "sameAs" : [
//                    "https://www.facebook.com/bobshospital"
//                ],
//                "url" : "http://www.bobshospital.com"
//            }
//        """
//
//        guard let data = json.data(using: .utf8) else {
//            XCTFail()
//            return
//        }
//
//        var thing: SOThing
//
//        do {
//            thing = try JSONDecoder().decode(SOThing.self, from: data)
//        } catch {
//            print(error)
//            XCTFail()
//            return
//        }
//
//        XCTAssertNotNil(thing.additionalType)
//        XCTAssertTrue(thing.additionalType == URL(string: "http://schema.org/MedicalEntity"))
//
//        XCTAssertNotNil(thing.alternativeName)
//        XCTAssertTrue(thing.alternativeName == "Pencil Pusher")
//
//        XCTAssertNotNil(thing.description)
//        XCTAssertTrue(thing.description == "A cog in the machine.")
//    }
}
