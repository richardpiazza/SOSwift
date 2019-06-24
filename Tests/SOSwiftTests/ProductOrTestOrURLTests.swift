import XCTest
@testable import SOSwift

class ProductOrTextOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var product: ProductOrURLOrText?
        var text: ProductOrURLOrText?
        var url: ProductOrURLOrText?
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
        
        let product = Product()
        product.name = "MacBook"
        testObject.product = .product(value: product)
        testObject.text = .text(value: "Laptop")
        testObject.url = .url(value: URL(string: "https://www.apple.com/macbook")!)
        
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
