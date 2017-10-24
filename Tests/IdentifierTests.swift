import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class IdentifierTests: XCTestCase {

    class Identifiable: Codable {
        var identifier: Identifier?
        
        private enum CodingKeys: String, CodingKey {
            case identifier
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let value = try container.decodeIdentifierIfPresent(forKey: .identifier) {
                self.identifier = value
            }
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.identifier, forKey: .identifier)
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

    func testPropertyValue() {
        let json = """
            {
                "identifier" : {
                    "@type" : "PropertyValue",
                    "value" : "valueText"
                }
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var identifiable: Identifiable
        
        do {
            identifiable = try JSONDecoder().decode(Identifiable.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        guard let value = identifiable.identifier as? PropertyValue else {
            XCTFail()
            return
        }
        
        guard let equatable = value.value as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(equatable, "valueText")
    }

    func testURL() {
        let json = """
            {
                "identifier" : "http://www.google.com"
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var identifiable: Identifiable
        
        do {
            identifiable = try JSONDecoder().decode(Identifiable.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        guard let value = identifiable.identifier as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(value.host, "www.google.com")
    }
    
    func testString() {
        let json = """
            {
                "identifier" : "1234567890"
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        var identifiable: Identifiable
        
        do {
            identifiable = try JSONDecoder().decode(Identifiable.self, from: data)
        } catch {
            print(error)
            XCTFail()
            return
        }
        
        guard let value = identifiable.identifier as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(value, "1234567890")
    }
}
