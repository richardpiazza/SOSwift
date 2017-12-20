import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ProductOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var product: ProductOrText?
        var text: ProductOrText?
        
        private enum CodingKeys: String, CodingKey {
            case product
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.product = try container.decodeProductOrTextIfPresent(forKey: .product)
            self.text = try container.decodeProductOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.product, forKey: .product)
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
                "product" : {
                    "@type" : "Product",
                    "name" : "iMac"
                },
                "text" : "Desktop"
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
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let product = SOProduct()
        product.name = "MacBook"
        testObject.product = product
        
        testObject.text = "Laptop"
        
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
    }
}
