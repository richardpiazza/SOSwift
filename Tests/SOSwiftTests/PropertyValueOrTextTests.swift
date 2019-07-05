import XCTest
@testable import SOSwift

class PropertyValueOrTextTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var propertyValue: PropertyValueOrText?
        var text: PropertyValueOrText?
    }
    
    func testDecode() throws {
        let json = """
        {
            "propertyValue" : {
                "@type" : "PropertyValue",
                "value" : 42
            },
            "text" : "Ultimate Answer"
        }
        """
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.propertyValue?.propertyValue?.value?.number?.integer, 42)
        XCTAssertEqual(testObject.text?.text, "Ultimate Answer")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let propertyValue = PropertyValue()
        propertyValue.unitText = "mL"
        testObject.propertyValue = .propertyValue(value: propertyValue)
        testObject.text = .text(value: "Measure")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let pv = dictionary["propertyValue"] as? [String : Any], let ut = pv["unitText"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(ut, "mL")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Measure")
    }
    
    func testEquatability() throws {
    }
}
