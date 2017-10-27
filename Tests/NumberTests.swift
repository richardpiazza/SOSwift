import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class NumberTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var int: Number?
        var float: Number?
        
        private enum CodingKeys: String, CodingKey {
            case int
            case float
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.int = try container.decodeNumberIfPresent(forKey: .int)
            self.float = try container.decodeNumberIfPresent(forKey: .float)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.int, forKey: .int)
            try container.encodeIfPresent(self.float, forKey: .float)
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
                "int" : 47,
                "float" : 42.42
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let int = testObject.int as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(int, 47)
        
        guard let float = testObject.float as? Float else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(float, Float(42.42))
        
        XCTAssertNil(testObject.int as? Float)
        XCTAssertNil(testObject.float as? Int)
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        testObject.int = 12345
        testObject.float = Float(12.345)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let i = dictionary["int"] as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(i, 12345)
        
        guard let f = dictionary["float"] as? Float else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(f, Float(12.345))
    }
}

