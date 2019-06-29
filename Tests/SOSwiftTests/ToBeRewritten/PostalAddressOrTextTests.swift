import XCTest
@testable import SOSwift

class PostalAddressOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var postalAddress: PostalAddressOrText?
        var text: PostalAddressOrText?
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "postalAddress" : {
                    "@type" : "PostalAddress",
                    "name" : "Infinite Loop"
                },
                "text" : "Apple Campus"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let postalAddress = testObject.postalAddress as? PostalAddress else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(postalAddress.name, "Infinite Loop")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Apple Campus")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let postalAddress = PostalAddress()
        postalAddress.name = "The Googleplex"
        testObject.postalAddress = .postalAddress(value: postalAddress)
        
        testObject.text = .text(value: "Google Campus")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let pa = dictionary["postalAddress"] as? [String : Any], let paName = pa["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paName, "The Googleplex")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Google Campus")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
