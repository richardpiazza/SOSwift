import XCTest
@testable import SOSwift

class ValueTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var structuredValue: Value?
        var bool: Value?
        var double: Value?
        var int: Value?
        var text: Value?
    }
    
    func testDecode() throws {
        let json = """
        {
            "structuredValue" : {
                "@type" : "StructuredValue",
                "name" : "Zero"
            },
            "bool" : true,
            "double" : 2.01,
            "int" : 3,
            "text" : "four"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.structuredValue?.structuredValue?.name, "Zero")
        XCTAssertNil(testClass.structuredValue?.number)
        XCTAssertNil(testClass.structuredValue?.bool)
        XCTAssertNil(testClass.structuredValue?.text)
        
        XCTAssertEqual(testClass.bool?.bool, true)
        XCTAssertNil(testClass.bool?.structuredValue)
        XCTAssertNil(testClass.bool?.number)
        XCTAssertNil(testClass.bool?.text)
        
        XCTAssertEqual(testClass.double?.number?.floatingPoint, 2.01)
        XCTAssertNil(testClass.double?.number?.integer)
        XCTAssertNil(testClass.double?.structuredValue)
        XCTAssertNil(testClass.double?.bool)
        XCTAssertNil(testClass.double?.text)
        
        XCTAssertEqual(testClass.int?.number?.integer, 3)
        XCTAssertNil(testClass.int?.number?.floatingPoint)
        XCTAssertNil(testClass.int?.structuredValue)
        XCTAssertNil(testClass.int?.bool)
        XCTAssertNil(testClass.int?.text)
        
        XCTAssertEqual(testClass.text?.text, "four")
        XCTAssertNil(testClass.text?.structuredValue)
        XCTAssertNil(testClass.text?.number)
        XCTAssertNil(testClass.text?.bool)
        
        let dictionaryWithMissingType = """
        {
            "structuredValue": {
                "value": "valueText"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: dictionaryWithMissingType))
        
        let dictionaryWithInvalidType = """
        {
            "structuredValue": {
                "@type": "StRuCtUrEdVaLuE",
                "name": "Zero"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: dictionaryWithInvalidType))
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let structuredValue = StructuredValue()
        structuredValue.name = "Hundreds"
        testObject.structuredValue = Value(structuredValue)
        testObject.bool = Value(false)
        testObject.double = Value(.floatingPoint(value: 39.1))
        testObject.int = Value(.integer(value: 100))
        testObject.text = Value("🔟")
        
        let dictionary = try testObject.asDictionary()
        let sv = (dictionary["structuredValue"] as? [String : Any])?["name"] as? String
        let b = dictionary["bool"] as? Bool
        let f = dictionary["double"] as? Double
        let i = dictionary["int"] as? Int
        let s = dictionary["text"] as? String
        
        XCTAssertEqual(sv, "Hundreds")
        XCTAssertEqual(b, false)
        XCTAssertEqual(f, 39.1)
        XCTAssertEqual(i, 100)
        XCTAssertEqual(s, "🔟")
    }
}
