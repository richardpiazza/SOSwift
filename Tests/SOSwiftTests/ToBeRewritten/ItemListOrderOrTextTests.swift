import XCTest
@testable import SOSwift

class ItemListOrderOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var itemListOrder: ItemListOrderOrText?
        var text: ItemListOrderOrText?
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "itemListOrder" : "ItemListOrderDescending",
                "text" : "Some Text"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let ilo = testObject.itemListOrder as? ItemListOrder else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(ilo, .decending)
        
        guard let t = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Some Text")
    }
    
    func testSingleEncodes() {
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
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
