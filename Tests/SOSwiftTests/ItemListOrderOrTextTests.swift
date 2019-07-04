import XCTest
@testable import SOSwift

class ItemListOrderOrTextTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var itemListOrder: ItemListOrderOrText?
        var text: ItemListOrderOrText?
    }
    
    func testDecode() throws {
        let json = """
            {
                "itemListOrder" : "ItemListOrderDescending",
                "text" : "Some Text"
            }
        """
        
        let testObject = try TestClass.make(with: json)
        
        XCTAssertEqual(testObject.itemListOrder?.itemListOrder, .descending)
        XCTAssertEqual(testObject.text?.text, "Some Text")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        testObject.itemListOrder = .itemListOrder(value: .unordered)
        testObject.text = .text(value: "Ascending?")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let ilo = dictionary["itemListOrder"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(ilo, "ItemListUnordered")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Ascending?")
    }
    
    func testEquatability() throws {
        
    }
}
