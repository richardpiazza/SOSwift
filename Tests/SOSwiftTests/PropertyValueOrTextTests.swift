import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class PropertyValueOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var propertyValue: PropertyValueOrText?
        var text: PropertyValueOrText?
        
        private enum CodingKeys: String, CodingKey {
            case propertyValue
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.propertyValue = try container.decodePropertyValueOrTextIfPresent(forKey: .propertyValue)
            self.text = try container.decodePropertyValueOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.propertyValue, forKey: .propertyValue)
            try container.encodeIfPresent(self.text, forKey: .text)
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "propertyValue" : {
                    "@type" : "PropertyValue",
                    "value" : 42
                },
                "text" : "Ultimate Answer"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
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
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let propertyValue = SOPropertyValue()
        propertyValue.unitText = "mL"
        testObject.propertyValue = propertyValue
        
        testObject.text = "Measure"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
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
