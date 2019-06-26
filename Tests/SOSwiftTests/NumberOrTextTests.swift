import XCTest
@testable import SOSwift

class NumberOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var number: NumberOrText?
        var text: NumberOrText?
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
        
        testObject.number = NumberOrText(.floatingPoint(value: 4.7))
        testObject.text = .text(value: "Almost Five")
        
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

