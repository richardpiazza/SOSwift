import XCTest
@testable import SOSwift

class NumberTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var integer: Number?
        var floatingPoint: Number?
    }
    
    func testDecode() throws {
        let json = """
        {
            "integer" : 47,
            "floatingPoint" : 42.42
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.integer?.integer, 47)
        XCTAssertNil(testClass.integer?.floatingPoint)
        XCTAssertEqual(testClass.floatingPoint?.floatingPoint, 42.42)
        XCTAssertNil(testClass.floatingPoint?.integer)
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        testObject.integer = Number(12345)
        testObject.floatingPoint = Number(12.345)
        
        let dictionary = try testObject.asDictionary()
        let integer = dictionary["integer"] as? Int
        let floatingPoint = dictionary["floatingPoint"] as? Double
        
        XCTAssertEqual(integer, 12345)
        XCTAssertEqual(floatingPoint, 12.345)
    }
    
    func testEquatability() throws {
        let int1: Number = .integer(value: 10)
        let int2: Number = .integer(value: 13)
        let int3: Number = .integer(value: 13)
        
        let fp1: Number = .floatingPoint(value: 1.6)
        let fp2: Number = .floatingPoint(value: 88.66)
        let fp3: Number = .floatingPoint(value: 88.66)
        
        XCTAssertNotEqual(int1, int2)
        XCTAssertNotEqual(int1, fp1)
        XCTAssertNotEqual(int1, fp2)
        XCTAssertNotEqual(int1, fp3)
        XCTAssertEqual(int2, int3)
        
        XCTAssertNotEqual(fp1, fp2)
        XCTAssertNotEqual(fp1, int2)
        XCTAssertNotEqual(fp1, int3)
        XCTAssertEqual(fp2, fp3)
    }
}

