import XCTest
@testable import SOSwift

class ProductOrServiceTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var product: ProductOrService?
        var service: ProductOrService?
        var multiple: [ProductOrService]?
    }
    
    func testDecode() throws {
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
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.product?.product?.name, "Toyota Camery")
        XCTAssertEqual(testObject.service?.service?.name, "Tune-up")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let product = Product()
        product.name = "Airplane"
        testObject.product = .product(value: product)
        
        let service = Service()
        service.name = "In-Flight WiFi"
        testObject.service = .service(value: service)
        
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
        
        XCTAssertEqual(pName, "Airplane")
        
        guard let s = dictionary["service"] as? [String : Any], let sName = s["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sName, "In-Flight WiFi")
    }
    
    func testEquatability() throws {
    }
}
