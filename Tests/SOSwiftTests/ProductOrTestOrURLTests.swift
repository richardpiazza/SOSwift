import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ProductOrTextOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var product: ProductOrURLOrText?
        var text: ProductOrURLOrText?
        var url: ProductOrURLOrText?
        
        private enum CodingKeys: String, CodingKey {
            case product
            case text
            case url
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.product = try container.decodeProductOrURLOrTextIfPresent(forKey: .product)
            self.text = try container.decodeProductOrURLOrTextIfPresent(forKey: .text)
            self.url = try container.decodeProductOrURLOrTextIfPresent(forKey: .url)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.product, forKey: .product)
            try container.encodeIfPresent(self.text, forKey: .text)
            try container.encodeIfPresent(self.url, forKey: .url)
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
                "product" : {
                    "@type" : "Product",
                    "name" : "iMac"
                },
                "text" : "Desktop",
                "url" : "https://www.apple.com/imac"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let product = testObject.product as? Product else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(product.name, "iMac")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Desktop")
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.apple.com")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let product = SOProduct()
        product.name = "MacBook"
        testObject.product = product
        
        testObject.text = "Laptop"
        testObject.url = URL(string: "https://www.apple.com/macbook")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let p = dictionary["product"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "MacBook")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Laptop")
        
        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.apple.com")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
