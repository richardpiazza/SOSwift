import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class MonetaryAmountOrPriceSpecificationTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var monetaryAmount: MonetaryAmountOrPriceSpecification?
        var priceSpecification: MonetaryAmountOrPriceSpecification?
        
        private enum CodingKeys: String, CodingKey {
            case monetaryAmount
            case priceSpecification
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.monetaryAmount = try container.decodeMonetaryAmountOrPriceSpecificationIfPresent(forKey: .monetaryAmount)
            self.priceSpecification = try container.decodeMonetaryAmountOrPriceSpecificationIfPresent(forKey: .priceSpecification)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.monetaryAmount, forKey: .monetaryAmount)
            try container.encodeIfPresent(self.priceSpecification, forKey: .priceSpecification)
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
        
        let monetaryAmount = SOMonetaryAmount()
        monetaryAmount.name = "One Hundred"
        testObject.monetaryAmount = monetaryAmount
        
        let priceSpecification = SOPriceSpecification()
        priceSpecification.name = "One Thousand"
        testObject.priceSpecification = priceSpecification
        
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

