import XCTest
@testable import SOSwift

class IntegerOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var integer: IntegerOrText?
        var text: IntegerOrText?
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
        testObject.integer = .integer(value: 100)
        testObject.text = .text(value: "One Hundred")
        
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

