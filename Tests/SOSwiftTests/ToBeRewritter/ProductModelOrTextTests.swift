import XCTest
@testable import SOSwift

class ProductModelOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var productModel: ProductModelOrText?
        var text: ProductModelOrText?
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "productModel" : {
                    "@type" : "ProductModel",
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
        
        guard let productModel = testObject.productModel as? ProductModel else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(productModel.name, "iMac")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Desktop")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let productModel = ProductModel()
        productModel.name = "MacBook"
        testObject.productModel = .productModel(value: productModel)
        
        testObject.text = .text(value: "Laptop")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
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
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
