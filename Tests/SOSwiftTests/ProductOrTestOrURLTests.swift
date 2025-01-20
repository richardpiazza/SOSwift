@testable import SOSwift
import XCTest

class ProductOrTextOrURLTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var product: ProductOrURLOrText?
        var text: ProductOrURLOrText?
        var url: ProductOrURLOrText?
    }

    func testDecode() throws {
        let json = """
        {
            "product" : {
                "@type" : "Product",
                "name" : "iMac"
            },
            "text" : "Desktop",
            "url" : "https://www.apple.com/imac"
        }
        """

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.product?.product?.name, "iMac")
        XCTAssertEqual(testObject.text?.text, "Desktop")
        XCTAssertEqual(testObject.url?.url?.host, "www.apple.com")
    }

    func testEncode() throws {
        let testObject = TestClass()

        let product = Product()
        product.name = "MacBook"
        testObject.product = .product(value: product)
        testObject.text = .text(value: "Laptop")
        testObject.url = .url(value: URL(string: "https://www.apple.com/macbook")!)

        let dictionary: [String: Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }

        guard let p = dictionary["product"] as? [String: Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(pName, "MacBook")

        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(t, "Laptop")

        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }

        XCTAssertEqual(url.host, "www.apple.com")
    }

    func testEquatability() throws {}
}
