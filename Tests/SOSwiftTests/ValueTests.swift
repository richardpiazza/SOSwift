import XCTest
@testable import SOSwift

class ValueTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var structuredValue: Value?
        var bool: Value?
        var double: Value?
        var int: Value?
        var string: Value?
        
        private enum CodingKeys: String, CodingKey {
            case structuredValue
            case bool
            case double
            case int
            case string
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.structuredValue = try container.decodeValueIfPresent(forKey: .structuredValue)
            self.bool = try container.decodeValueIfPresent(forKey: .bool)
            self.double = try container.decodeValueIfPresent(forKey: .double)
            self.int = try container.decodeValueIfPresent(forKey: .int)
            self.string = try container.decodeValueIfPresent(forKey: .string)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.structuredValue, forKey: .structuredValue)
            try container.encodeIfPresent(self.bool, forKey: .bool)
            try container.encodeIfPresent(self.double, forKey: .double)
            try container.encodeIfPresent(self.int, forKey: .int)
            try container.encodeIfPresent(self.string, forKey: .string)
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
                "structuredValue" : {
                    "@type" : "StructuredValue",
                    "name" : "Zero"
                },
                "bool" : true,
                "double" : 2.01,
                "int" : 3,
                "string" : "four"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let sv = testObject.structuredValue as? StructuredValue else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sv.name, "Zero")
        
        guard let bool = testObject.bool as? Bool else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(bool, true)
        
        guard let double = testObject.double as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(double, 2.01)
        
        guard let int = testObject.int as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(int, 3)
        
        guard let string = testObject.string as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(string, "four")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let structuredValue = SOStructuredValue()
        structuredValue.name = "Hundreds"
        testObject.structuredValue = structuredValue
        
        testObject.bool = false
        testObject.double = 39.1
        testObject.int = 100
        testObject.string = "🔟"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let sv = dictionary["structuredValue"] as? [String : Any], let svName = sv["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(svName, "Hundreds")
        
        guard let b = dictionary["bool"] as? Bool else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(b, false)
        
        guard let f = dictionary["double"] as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(f, 39.1)
        
        guard let i = dictionary["int"] as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(i, 100)
        
        guard let s = dictionary["string"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(s, "🔟")
    }
}
