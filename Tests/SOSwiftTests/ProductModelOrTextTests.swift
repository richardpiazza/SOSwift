import XCTest
@testable import SOSwift

class ProductModelOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var productModel: ProductModelOrText?
        var text: ProductModelOrText?
    }
    
    func testDecode() throws {
        let json = """
        {
            "productModel" : {
                "@type" : "ProductModel",
                "name" : "iMac"
            },
            "text" : "Desktop"
        }
        """
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.productModel?.productModel?.name, "iMac")
        XCTAssertEqual(testObject.text?.text, "Desktop")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let productModel = ProductModel()
        productModel.name = "MacBook"
        testObject.productModel = .productModel(value: productModel)
        
        testObject.text = .text(value: "Laptop")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let pm = dictionary["productModel"] as? [String : Any], let pmName = pm["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pmName, "MacBook")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Laptop")
    }
    
    func testEquatability() throws {
        
    }
}
