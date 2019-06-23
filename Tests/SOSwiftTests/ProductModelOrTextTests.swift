import XCTest
@testable import SOSwift

class ProductModelOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var productModel: ProductModelOrText?
        var text: ProductModelOrText?
        
        private enum CodingKeys: String, CodingKey {
            case productModel
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.productModel = try container.decodeProductModelOrTextIfPresent(forKey: .productModel)
            self.text = try container.decodeProductModelOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.productModel, forKey: .productModel)
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
        
        let productModel = SOProductModel()
        productModel.name = "MacBook"
        testObject.productModel = productModel
        
        testObject.text = "Laptop"
        
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
