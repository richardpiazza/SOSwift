import XCTest
@testable import SOSwift

class PlaceOrPostalAddressOrTextTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var place: PlaceOrPostalAddressOrText?
        var postalAddress: PlaceOrPostalAddressOrText?
        var text: PlaceOrPostalAddressOrText?
    }
    
    func testDecode() throws {
        let json = """
        {
            "place" : {
                "@type" : "Place",
                "name" : "Apple Campus"
            },
            "postalAddress" : {
                "@type" : "PostalAddress",
                "name" : "Infinite Loop"
            },
            "text" : "Pre-Spaceship"
        }
        """
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.place?.place?.name, "Apple Campus")
        XCTAssertEqual(testObject.postalAddress?.postalAddress?.name, "Infinite Loop")
        XCTAssertEqual(testObject.text?.text, "Pre-Spaceship")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let place = Place()
        place.name = "Google Campus"
        testObject.place = .place(value: place)
        
        let postalAddress = PostalAddress()
        postalAddress.name = "Mountain View"
        testObject.postalAddress = .postalAddress(value: postalAddress)
        
        testObject.text = .text(value: "The Googleplex")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let p = dictionary["place"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Google Campus")
        
        guard let pa = dictionary["postalAddress"] as? [String : Any], let paName = pa["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paName, "Mountain View")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "The Googleplex")
    }
    
    func testEquatability() throws {
        
    }
}
