import XCTest
@testable import SOSwift

class IdentifierTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecode", testSingleDecode),
        ("testSingleEncode", testSingleEncode),
    ]
    
    fileprivate class TestClass: Schema, Codable {
        var propertyValue: Identifier?
        var url: Identifier?
        var text: Identifier?
    }

    func testSingleDecode() throws {
        let json = """
        {
            "propertyValue" : {
                "@type" : "PropertyValue",
                "value" : "valueText"
            },
            "url" : "http://www.google.com",
            "text" : "1234567890"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.propertyValue?.propertyValue?.value?.text, "valueText")
        XCTAssertEqual(testClass.url?.url, URL(string: "http://www.google.com"))
        XCTAssertEqual(testClass.text?.text, "1234567890")
    }
    
    func testSingleEncode() throws {
        let testObject = TestClass()
        
        let propertyValue = PropertyValue()
        propertyValue.value = .text(value: "Six")
        testObject.propertyValue = .propertyValue(value: propertyValue)
        
        testObject.url = .url(value: URL(string: "https://www.apple.com")!)
        testObject.text = .text(value: "Thanks")
        
        let dictionary = try testObject.asDictionary()
        let pv = dictionary["propertyValue"] as? [String : Any]
        let pvValue = pv?["value"] as? String
        
        XCTAssertEqual(pvValue, "Six")
        
        let u = dictionary["url"] as? String
        
        XCTAssertEqual(u?.contains("www.apple.com"), true)
        
        let t = dictionary["text"] as? String
        XCTAssertEqual(t, "Thanks")
    }
}
