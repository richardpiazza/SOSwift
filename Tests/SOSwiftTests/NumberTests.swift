import XCTest
@testable import SOSwift

class NumberTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
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
}

