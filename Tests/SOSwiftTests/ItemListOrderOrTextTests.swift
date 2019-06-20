import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ItemListOrderOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var itemListOrder: ItemListOrderOrText?
        var text: ItemListOrderOrText?
        
        private enum CodingKeys: String, CodingKey {
            case itemListOrder
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.itemListOrder = try container.decodeItemListOrderOrTextIfPresent(forKey: .itemListOrder)
            self.text = try container.decodeItemListOrderOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.itemListOrder, forKey: .itemListOrder)
            try container.encodeIfPresent(self.text, forKey: .text)
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
        testObject.itemListOrder = ItemListOrder.unordered
        testObject.text = "Ascending?"
        
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
