import XCTest
@testable import SOSwift

class GenderOrTextTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var gender: GenderOrText?
        var text: GenderOrText?
        var multiple: [GenderOrText]?
        
        private enum CodingKeys: String, CodingKey {
            case gender
            case text
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.gender = try container.decodeGenderOrTextIfPresent(forKey: .gender)
            self.text = try container.decodeGenderOrTextIfPresent(forKey: .text)
            self.multiple = try container.decodeGendersOrTextsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.gender, forKey: .gender)
            try container.encodeIfPresent(self.text, forKey: .text)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "gender" : "Female",
                "text" : "Non-Binary"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let gender = (testObject.gender as? SOGenderOrText)?.gender else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(gender, .female)
        
        guard let text = (testObject.text as? SOGenderOrText)?.text else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Non-Binary")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        testObject.gender = Gender.male
        testObject.text = "Gender Queer"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let g = dictionary["gender"] as? String, let gender = Gender(rawValue: g) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(gender, .male)
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Gender Queer")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                "Female",
                "Non-Binary"
            ]
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        guard let multiple = testObject.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        let gender = (multiple[0] as? SOGenderOrText)?.gender
        let text = (multiple[1] as? SOGenderOrText)?.text
        
        XCTAssertEqual(gender, .female)
        XCTAssertEqual(text, "Non-Binary")
    }
    
    func testMultipleEncodes() throws {
        var multiple = [SOGenderOrText]()
        multiple.append(.gender(value: .male))
        multiple.append(.text(value: "None of your business."))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.dictionary()
        XCTAssertEqual(dictionary.keys.count, 1)
        
        guard let value = dictionary["multiple"] as? [String] else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(value[0], Gender.male.rawValue)
        XCTAssertEqual(value[1], "None of your business.")
    }
}

