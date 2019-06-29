import XCTest
@testable import SOSwift

class ListItemOrTextOrThingTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var listItem: ListItemOrThingOrText?
        var text: ListItemOrThingOrText?
        var thing: ListItemOrThingOrText?
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
        
        let listItem = ListItem()
        listItem.name = "LI 2"
        testObject.listItem = .listItem(value: listItem)
        
        testObject.text = .text(value: "Text 2")
        
        let thing = Thing()
        thing.name = "T 2"
        testObject.thing = .thing(value: thing)
        
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
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}

