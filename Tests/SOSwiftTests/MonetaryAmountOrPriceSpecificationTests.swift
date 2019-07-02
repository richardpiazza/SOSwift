import XCTest
@testable import SOSwift

class MonetaryAmountOrPriceSpecificationTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var monetaryAmount: MonetaryAmountOrPriceSpecification?
        var priceSpecification: MonetaryAmountOrPriceSpecification?
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "monetaryAmount" : {
                    "@type" : "MonetaryAmount",
                    "name" : "Monetary Amount"
                },
                "priceSpecification" : {
                    "@type" : "PriceSpecification",
                    "name" : "Price Specification"
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
        
        guard let ma = testObject.monetaryAmount as? MonetaryAmount else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(ma.name, "Monetary Amount")
        
        guard let ps = testObject.priceSpecification as? PriceSpecification else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(ps.name, "Price Specification")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let monetaryAmount = MonetaryAmount()
        monetaryAmount.name = "One Hundred"
        testObject.monetaryAmount = .monetaryAmount(value: monetaryAmount)
        
        let priceSpecification = PriceSpecification()
        priceSpecification.name = "One Thousand"
        testObject.priceSpecification = .priceSpecification(value: priceSpecification)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let ma = dictionary["monetaryAmount"] as? [String : Any], let maName = ma["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(maName, "One Hundred")
        
        guard let ps = dictionary["priceSpecification"] as? [String : Any], let psName = ps["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(psName, "One Thousand")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}

