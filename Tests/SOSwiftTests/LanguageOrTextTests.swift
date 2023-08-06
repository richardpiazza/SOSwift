import XCTest
@testable import SOSwift

class LanguageOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var language: LanguageOrText?
        var text: LanguageOrText?
    }
    
    func testDecode() throws {
        let json = """
            {
                "language" : {
                    "@type" : "Language",
                    "name" : "Klingon"
                },
                "text" : "Universal Translator"
            }
        """
        
        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.language?.language?.name, "Klingon")
        XCTAssertNil(testClass.language?.text)
        XCTAssertEqual(testClass.text?.text, "Universal Translator")
        XCTAssertNil(testClass.text?.language)
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let language = Language()
        language.name = "Vulcan"
        testObject.language = .language(value: language)
        
        testObject.text = .text(value: "Google Translate")
        
        let dictionary = try testObject.asDictionary()
        
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
    
    func testEquatability() throws {
    }
}

