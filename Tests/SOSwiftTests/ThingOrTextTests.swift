import XCTest
@testable import SOSwift

class ThingOrTextTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var text: ThingOrText?
        var thing: ThingOrText?
    }
    
    func testDecode() throws {
        let json = """
        {
            "text" : "Breakfast",
            "thing" : {
                "@type" : "Thing",
                "name" : "Cereal"
            }
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.text?.text, "Breakfast")
        XCTAssertNil(testClass.text?.thing)
        
        XCTAssertEqual(testClass.thing?.thing?.name, "Cereal")
        XCTAssertNil(testClass.thing?.text)
        
        let dictionaryWithMissingType = """
        {
            "thing": {
                "name": "Cereal"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: dictionaryWithMissingType))
        
        let dictionaryWithInvalidType = """
        {
            "thing": {
                "@type": "ThInG",
                "name": "Cereal"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: dictionaryWithInvalidType))
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.text = ThingOrText("Dinner")
        
        let thing = Thing()
        thing.name = "Steak"
        testClass.thing = ThingOrText(thing)
        
        let dictionary = try testClass.asDictionary()
        
        let text = dictionary["text"] as? String
        XCTAssertEqual(text, "Dinner")
        let name = (dictionary["thing"] as? [String : Any])?["name"] as? String
        XCTAssertEqual(name, "Steak")
    }
}
