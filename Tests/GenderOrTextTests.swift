import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class GenderOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var gender: GenderOrText?
        var text: GenderOrText?
        
        private enum CodingKeys: String, CodingKey {
            case gender
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.gender = try container.decodeGenderOrTextIfPresent(forKey: .gender)
            self.text = try container.decodeGenderOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.gender, forKey: .gender)
            try container.encodeIfPresent(self.text, forKey: .text)
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
        
        guard let gender = testObject.gender as? Gender else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(gender, .female)
        
        guard let text = testObject.text as? String else {
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
}

