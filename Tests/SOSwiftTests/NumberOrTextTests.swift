import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class NumberOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var number: NumberOrText?
        var text: NumberOrText?
        
        private enum CodingKeys: String, CodingKey {
            case number
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.number = try container.decodeNumberOrTextIfPresent(forKey: .number)
            self.text = try container.decodeNumberOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.number, forKey: .number)
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
                "number" : 47,
                "text" : "LCARS"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let n = testObject.number as? Number, let number = n as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(number, 47)
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "LCARS")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        testObject.number = 4.7
        testObject.text = "Almost Five"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let n = dictionary["number"] as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(n, 4.7)
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Almost Five")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}

