import XCTest
@testable import SOSwift

class NumberTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var int: Number?
        var double: Number?
        
        private enum CodingKeys: String, CodingKey {
            case int
            case double
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.int = try container.decodeNumberIfPresent(forKey: .int)
            self.double = try container.decodeNumberIfPresent(forKey: .double)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.int, forKey: .int)
            try container.encodeIfPresent(self.double, forKey: .double)
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
                "double" : 42.42
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
        
        guard let double = testObject.double as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(double, 42.42)
        
        XCTAssertNil(testObject.int as? Double)
        XCTAssertNil(testObject.double as? Int)
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        testObject.int = 12345
        testObject.double = 12.345
        
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
        
        guard let f = dictionary["double"] as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(f, 12.345)
    }
}

