import XCTest
@testable import SOSwift

class ProductOrTextTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var product: ProductOrText?
        var text: ProductOrText?
    }
    
    func testDecode() throws {
        let json = """
        {
            "product" : {
                "@type" : "Product",
                "name" : "iMac"
            },
            "text" : "Desktop"
        }
        """
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.product?.product?.name, "iMac")
        XCTAssertEqual(testObject.text?.text, "Desktop")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let product = Product()
        product.name = "MacBook"
        testObject.product = .product(value: product)
        testObject.text = .text(value: "Laptop")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.asDictionary()
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
    
    func testEquatability() throws {
        
    }
}
