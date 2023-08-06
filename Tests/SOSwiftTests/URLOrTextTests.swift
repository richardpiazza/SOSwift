import XCTest
@testable import SOSwift

class URLOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var text: URLOrText?
        var url: URLOrText?
    }
    
    func testDecode() throws {
        let json = """
        {
            "text" : "Wikipedia",
            "url" : "https://en.wikipedia.org"
        }
        """
        
        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.text?.text, "Wikipedia")
        XCTAssertNil(testClass.text?.url)
        XCTAssertEqual(testClass.url?.url?.host, "en.wikipedia.org")
        XCTAssertNil(testClass.url?.text)
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.text = URLOrText("Wikimedia Commons")
        testClass.url = URLOrText(URL(string: "https://commons.wikimedia.org")!)
        
        let dictionary = try testClass.asDictionary()
        XCTAssertEqual(dictionary["text"] as? String, "Wikimedia Commons")
        XCTAssertEqual(dictionary["url"] as? String, "https://commons.wikimedia.org")
    }
    
    func testEquatability() throws {
        let one = URLOrText("One")
        let two = URLOrText("One")
        let three = URLOrText(URL(string: "https://www.google.com")!)
        
        XCTAssertEqual(one, two)
        XCTAssertNotEqual(one, three)
    }
}
