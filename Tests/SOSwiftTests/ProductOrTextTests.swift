import XCTest
@testable import SOSwift

class ProductOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var product: ProductOrText?
        var text: ProductOrText?
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
        
        let product = Product()
        product.name = "MacBook"
        testObject.product = .product(value: product)
        testObject.text = .text(value: "Laptop")
        
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
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
