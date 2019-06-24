import XCTest
@testable import SOSwift

class LanguageOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var language: LanguageOrText?
        var text: LanguageOrText?
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
        
        let language = Language()
        language.name = "Vulcan"
        testObject.language = .language(value: language)
        
        testObject.text = .text(value: "Google Translate")
        
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
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}

