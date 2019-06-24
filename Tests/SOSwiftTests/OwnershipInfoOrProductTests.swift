import XCTest
@testable import SOSwift

class OwnershipInfoOrProductTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var ownershipInfo: OwnershipInfoOrProduct?
        var product: OwnershipInfoOrProduct?
        var multiple: [OwnershipInfoOrProduct]?
    }
    
    func testSingleDecodes() {
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
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let o = testObject.ownershipInfo as? OwnershipInfo else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(o.name, "It's Mine")
        
        guard let p = testObject.product as? Product else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(p.name, "iMac")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let ownershipInfo = OwnershipInfo()
        ownershipInfo.name = "Bob's"
        testObject.ownershipInfo = .ownershipInfo(value: ownershipInfo)
        
        let product = Product()
        product.name = "Burgers"
        testObject.product = .product(value: product)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
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
    
    func testMultipleDecodes() {
        let json = """
            {
                "multiple" : [
                    {
                        "@type" : "OwnershipInfo",
                        "name" : "Apple"
                    },
                    {
                        "@type" : "Product",
                        "name" : "Spaceship"
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
        
        guard let o = multiple[0] as? OwnershipInfo else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(o.name, "Apple")
        
        guard let p = multiple[1] as? Product else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(p.name, "Spaceship")
    }
    
    func testMultipleEncodes() {
        let testObject = TestClass()
        
        let ownershipInfo = OwnershipInfo()
        ownershipInfo.name = "Microsoft"
        
        let product = Product()
        product.name = "Tears & Headaches"
        
        testObject.multiple = [.ownershipInfo(value: ownershipInfo), .product(value: product)]
        
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
        
        guard let o = multiple[0] as? [String : Any], let oName = o["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(oName, "Microsoft")
        
        guard let p = multiple[1] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Tears & Headaches")
    }
}
