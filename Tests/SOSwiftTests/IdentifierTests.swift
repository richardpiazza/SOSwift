import XCTest
@testable import SOSwift

class IdentifierTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var propertyValue: Identifier?
        var url: Identifier?
        var text: Identifier?
    }

    func testDecode() throws {
        let json = """
        {
            "propertyValue": {
                "@type": "PropertyValue",
                "value": "valueText"
            },
            "url": "http://www.google.com",
            "text": "1234567890"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.propertyValue?.propertyValue?.value?.text, "valueText")
        XCTAssertNil(testClass.propertyValue?.url)
        XCTAssertNil(testClass.propertyValue?.text)
        XCTAssertEqual(testClass.url?.url, URL(string: "http://www.google.com"))
        XCTAssertNil(testClass.url?.propertyValue)
        XCTAssertNil(testClass.url?.text)
        XCTAssertEqual(testClass.text?.text, "1234567890")
        XCTAssertNil(testClass.text?.propertyValue)
        XCTAssertNil(testClass.text?.url)
        
        let dictionaryWithMissingType = """
        {
            "propertyValue": {
                "value": "valueText"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: dictionaryWithMissingType))
        
        let dictionaryWithInvalidType = """
        {
            "propertyValue": {
                "@type": "PrOpErTyVaLuE",
                "value": "valueText"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: dictionaryWithInvalidType))
    }
    
    func testEncode() throws {
        let propertyValue = PropertyValue()
        propertyValue.value = .text(value: "Six")
        
        let testObject = TestClass()
        testObject.propertyValue = .propertyValue(value: propertyValue)
        testObject.url = .url(value: URL(string: "https://www.apple.com")!)
        testObject.text = .text(value: "Thanks")
        
        let dictionary = try testObject.asDictionary()
        let pv = (dictionary["propertyValue"] as? [String : Any])?[PropertyValue.PropertyValueCodingKeys.value.rawValue] as? String
        let u = dictionary["url"] as? String
        let t = dictionary["text"] as? String
        
        XCTAssertEqual(pv, "Six")
        XCTAssertEqual(u, "https://www.apple.com")
        XCTAssertEqual(t, "Thanks")
    }
}
