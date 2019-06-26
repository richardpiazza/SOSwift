import XCTest
@testable import SOSwift

class PropertyValueOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var propertyValue: PropertyValueOrText?
        var text: PropertyValueOrText?
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
        
        guard let propertyValue = testObject.propertyValue as? PropertyValue, let value = propertyValue.value as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(value, 42)
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Ultimate Answer")
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
}
