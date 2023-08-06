import XCTest
@testable import SOSwift

class GenderOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var gender: Gender?
        var text: Gender?
    }
    
    func testDecode() throws {
        let json = """
        {
            "gender" : "Female",
            "text" : "Non-Binary"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.gender?.genderType, .female)
        XCTAssertNil(testClass.gender?.text)
        XCTAssertEqual(testClass.text?.text, "Non-Binary")
        XCTAssertNil(testClass.text?.genderType)
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.gender = Gender(GenderType.male)
        testClass.text = Gender("Gender Queer")
        
        let dictionary = try testClass.asDictionary()
        XCTAssertEqual(dictionary["gender"] as? String, GenderType.male.rawValue)
        XCTAssertEqual(dictionary["text"] as? String, "Gender Queer")
    }
    
    func testEquatability() throws {
        let t1 = Gender(.female)
        let t2 = Gender(.female)
        let t3 = Gender("Trans")
        
        XCTAssertEqual(t1, t2)
        XCTAssertNotEqual(t1, t3)
    }
}

