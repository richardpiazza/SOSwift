import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class IdentifierTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var propertyValue: Identifier?
        var url: Identifier?
        var text: Identifier?
        
        private enum CodingKeys: String, CodingKey {
            case propertyValue
            case url
            case text
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.propertyValue = try container.decodeIdentifierIfPresent(forKey: .propertyValue)
            self.url = try container.decodeIdentifierIfPresent(forKey: .url)
            self.text = try container.decodeIdentifierIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.propertyValue, forKey: .propertyValue)
            try container.encodeIfPresent(self.url, forKey: .url)
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

    func testSingleEncode() {
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
}
