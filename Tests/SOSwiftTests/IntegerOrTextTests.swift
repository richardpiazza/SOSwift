import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class IntegerOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var integer: IntegerOrText?
        var text: IntegerOrText?
        
        private enum CodingKeys: String, CodingKey {
            case integer
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.integer = try container.decodeIntegerOrTextIfPresent(forKey: .integer)
            self.text = try container.decodeIntegerOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.integer, forKey: .integer)
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
                "integer": 47,
                "text" : "Forty Seven"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let integer = testObject.integer as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(integer, 47)
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Forty Seven")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        testObject.integer = 100
        testObject.text = "One Hundred"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let i = dictionary["integer"] as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(i, 100)
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "One Hundred")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}

