import XCTest
@testable import SOSwift

class OwnershipInfoOrProductTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var ownershipInfo: OwnershipInfoOrProduct?
        var product: OwnershipInfoOrProduct?
        var multiple: [OwnershipInfoOrProduct]?
    }
    
    func testDecode() throws {
        let json = """
        {
            "ownershipInfo" : {
                "@type" : "OwnershipInfo",
                "name" : "It's Mine"
            },
            "product" : {
                "@type" : "Product",
                "name" : "iMac"
            }
        }
        """
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.ownershipInfo?.ownershipInfo?.name, "It's Mine")
        XCTAssertEqual(testObject.product?.product?.name, "iMac")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let ownershipInfo = OwnershipInfo()
        ownershipInfo.name = "Bob's"
        testObject.ownershipInfo = .ownershipInfo(value: ownershipInfo)
        
        let product = Product()
        product.name = "Burgers"
        testObject.product = .product(value: product)
        
        let dictionary = try testObject.asDictionary()
        
        guard let o = dictionary["ownershipInfo"] as? [String : Any], let oName = o["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(oName, "Bob's")
        
        guard let p = dictionary["product"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Burgers")
    }
    
    func testEquatability() throws {
    }
}
