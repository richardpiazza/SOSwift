import XCTest
@testable import SOSwift

class ValueTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var structuredValue: Value?
        var bool: Value?
        var double: Value?
        var int: Value?
        var string: Value?
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
        
        let structuredValue = StructuredValue()
        structuredValue.name = "Hundreds"
        testObject.structuredValue = .structuredValue(value: structuredValue)
        testObject.bool = .bool(value: false)
        testObject.double = Value(.floatingPoint(value: 39.1))
        testObject.int = Value(.integer(value: 100))
        testObject.string = .text(value: "🔟")
        
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
