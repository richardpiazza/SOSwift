import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ProductOrServiceTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var product: ProductOrService?
        var service: ProductOrService?
        var multiple: [ProductOrService]?
        
        private enum CodingKeys: String, CodingKey {
            case product
            case service
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.product = try container.decodeProductOrServiceIfPresent(forKey: .product)
            self.service = try container.decodeProductOrServiceIfPresent(forKey: .service)
            self.multiple = try container.decodeProductsOrServicesIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.product, forKey: .product)
            try container.encodeIfPresent(self.service, forKey: .service)
            try container.encodeIfPresent(self.multiple, forKey: .multiple)
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
                    "name" : "Toyota Camery"
                },
                "service" : {
                    "@type" : "Service",
                    "name" : "Tune-up"
                }
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
        
        XCTAssertEqual(product.name, "Toyota Camery")
        
        guard let service = testObject.service as? Service else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(service.name, "Tune-up")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let product = SOProduct()
        product.name = "Airplane"
        testObject.product = product
        
        let service = SOService()
        service.name = "In-Flight WiFi"
        testObject.service = service
        
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
        
        XCTAssertEqual(pName, "Airplane")
        
        guard let s = dictionary["service"] as? [String : Any], let sName = s["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sName, "In-Flight WiFi")
    }
    
    func testMultipleDecodes() {
        let json = """
            {
                "multiple" : [
                    {
                        "@type" : "Product",
                        "name" : "Toyota Camery"
                    },
                    {
                        "@type" : "Service",
                        "name" : "Tune-up"
                    }
                ]
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = testObject.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        guard let product = multiple[0] as? Product else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(product.name, "Toyota Camery")
        
        guard let service = multiple[1] as? Service else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(service.name, "Tune-up")
    }
    
    func testMultipleEncodes() {
        let testObject = TestClass()
        
        let product = SOProduct()
        product.name = "Airplane"
        
        let service = SOService()
        service.name = "In-Flight WiFi"
        
        testObject.multiple = [product, service]
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = dictionary["multiple"] as? [Any] else {
            XCTFail()
            return
        }
        
        guard let p = multiple[0] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Airplane")
        
        guard let s = multiple[1] as? [String : Any], let sName = s["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sName, "In-Flight WiFi")
    }
}
