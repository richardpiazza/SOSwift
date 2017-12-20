import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ListItemOrTextOrThingTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var listItem: ListItemOrThingOrText?
        var text: ListItemOrThingOrText?
        var thing: ListItemOrThingOrText?
        
        private enum CodingKeys: String, CodingKey {
            case listItem
            case text
            case thing
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.listItem = try container.decodeListItemOrThingOrTextIfPresent(forKey: .listItem)
            self.text = try container.decodeListItemOrThingOrTextIfPresent(forKey: .text)
            self.thing = try container.decodeListItemOrThingOrTextIfPresent(forKey: .thing)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.listItem, forKey: .listItem)
            try container.encodeIfPresent(self.text, forKey: .text)
            try container.encodeIfPresent(self.thing, forKey: .thing)
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
                "listItem" : {
                    "@type" : "ListItem",
                    "name" : "List Item"
                },
                "text" : "Some Text",
                "thing" : {
                    "@type" : "Thing",
                    "name" : "A Thing"
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
        
        guard let listItem = testObject.listItem as? ListItem else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(listItem.name, "List Item")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Some Text")
        
        guard let thing = testObject.thing as? Thing else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(thing.name, "A Thing")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let listItem = SOListItem()
        listItem.name = "LI 2"
        testObject.listItem = listItem
        
        testObject.text = "Text 2"
        
        let thing = SOThing()
        thing.name = "T 2"
        testObject.thing = thing
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let li = dictionary["listItem"] as? [String : Any], let liName = li["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(liName, "LI 2")
        
        guard let text = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Text 2")
        
        guard let t = dictionary["thing"] as? [String : Any], let tName = t["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(tName, "T 2")
    }
}

