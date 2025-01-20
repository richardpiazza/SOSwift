@testable import SOSwift
import XCTest

class MonetaryAmountOrPriceSpecificationTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var monetaryAmount: MonetaryAmountOrPriceSpecification?
        var priceSpecification: MonetaryAmountOrPriceSpecification?
    }

    func testDecode() throws {
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

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.monetaryAmount?.monetaryAmount?.name, "Monetary Amount")
        XCTAssertEqual(testObject.priceSpecification?.priceSpecification?.name, "Price Specification")
    }

    func testEncode() throws {
        let testObject = TestClass()

        let monetaryAmount = MonetaryAmount()
        monetaryAmount.name = "One Hundred"
        testObject.monetaryAmount = .monetaryAmount(value: monetaryAmount)

        let priceSpecification = PriceSpecification()
        priceSpecification.name = "One Thousand"
        testObject.priceSpecification = .priceSpecification(value: priceSpecification)

        let dictionary = try testObject.asDictionary()

        guard let ma = dictionary["monetaryAmount"] as? [String: Any], let maName = ma["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(maName, "One Hundred")

        guard let ps = dictionary["priceSpecification"] as? [String: Any], let psName = ps["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(psName, "One Thousand")
    }

    func testEquatability() throws {}
}
