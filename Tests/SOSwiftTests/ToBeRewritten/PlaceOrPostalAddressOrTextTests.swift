import XCTest
@testable import SOSwift

class PlaceOrPostalAddressOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var place: PlaceOrPostalAddressOrText?
        var postalAddress: PlaceOrPostalAddressOrText?
        var text: PlaceOrPostalAddressOrText?
    }
    
    func testSingleDecodes() {
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
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let place = testObject.place as? Place else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(place.name, "Apple Campus")
        
        guard let postalAddress = testObject.postalAddress as? PostalAddress else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(postalAddress.name, "Infinite Loop")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Pre-Spaceship")
    }
    
    func testSingleEncodes() {
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
            dictionary = try testObject.dictionary()
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
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
