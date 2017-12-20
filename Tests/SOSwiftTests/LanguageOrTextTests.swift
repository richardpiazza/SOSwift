import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class LanguageOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var language: LanguageOrText?
        var text: LanguageOrText?
        
        private enum CodingKeys: String, CodingKey {
            case language
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.language = try container.decodeLanguageOrTextIfPresent(forKey: .language)
            self.text = try container.decodeLanguageOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.language, forKey: .language)
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
                "language" : {
                    "@type" : "Language",
                    "name" : "Klingon"
                },
                "text" : "Universal Translator"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let language = testObject.language as? Language else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(language.name, "Klingon")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Universal Translator")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let language = SOLanguage()
        language.name = "Vulcan"
        testObject.language = language
        
        testObject.text = "Google Translate"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let l = dictionary["language"] as? [String : Any], let lName = l["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(lName, "Vulcan")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Google Translate")
    }
}

