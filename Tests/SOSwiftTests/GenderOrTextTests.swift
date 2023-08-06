import XCTest
@testable import SOSwift

class GenderOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var gender: GenderOrText?
        var text: GenderOrText?
    }
    
    func testDecode() throws {
        let json = """
        {
            "gender" : "Female",
            "text" : "Non-Binary"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.gender?.gender, .female)
        XCTAssertNil(testClass.gender?.text)
        XCTAssertEqual(testClass.text?.text, "Non-Binary")
        XCTAssertNil(testClass.text?.gender)
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.gender = GenderOrText(Gender.male)
        testClass.text = GenderOrText("Gender Queer")
        
        let dictionary = try testClass.asDictionary()
        XCTAssertEqual(dictionary["gender"] as? String, Gender.male.rawValue)
        XCTAssertEqual(dictionary["text"] as? String, "Gender Queer")
    }
    
    func testEquatability() throws {
        let t1 = GenderOrText(.female)
        let t2 = GenderOrText(.female)
        let t3 = GenderOrText("Trans")
        
        XCTAssertEqual(t1, t2)
        XCTAssertNotEqual(t1, t3)
    }
}

