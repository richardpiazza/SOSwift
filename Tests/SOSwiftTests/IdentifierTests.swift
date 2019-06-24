import XCTest
@testable import SOSwift

class IdentifierTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var propertyValue: Identifier?
        var url: Identifier?
        var text: Identifier?
    }

    func testSingleDecodes() {
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
        
        let testable: TestClass
        do {
            testable = try TestClass.make(with: json)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        guard let propertyValue = testable.propertyValue as? PropertyValue else {
            XCTFail()
            return
        }
        
        guard let value = propertyValue.value as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(value, "valueText")
        
        guard let url = testable.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.google.com")
        
        guard let text = testable.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "1234567890")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let propertyValue = PropertyValue()
        propertyValue.value = .text(value: "Six")
        testObject.propertyValue = .propertyValue(value: propertyValue)
        
        testObject.url = .url(value: URL(string: "https://www.apple.com")!)
        testObject.text = .text(value: "Thanks")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let pv = dictionary["propertyValue"] as? [String : Any] else {
            XCTFail()
            return
        }
        
        guard let pvValue = pv["value"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pvValue, "Six")
        
        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.apple.com")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Thanks")
    }
}
