import XCTest
@testable import SOSwift

class TextOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var text: URLOrText?
        var url: URLOrText?
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
                "text" : "Wikipedia",
                "url" : "https://en.wikipedia.org"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Wikipedia")
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "en.wikipedia.org")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        testObject.text = .text(value: "Wikimedia Commons")
        testObject.url = .url(value: URL(string: "https://commons.wikimedia.org")!)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let x = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(x, "Wikimedia Commons")
        
        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "commons.wikimedia.org")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
