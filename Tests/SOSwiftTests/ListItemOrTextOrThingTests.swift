import XCTest
@testable import SOSwift

class ListItemOrTextOrThingTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var listItem: ListItemOrThingOrText?
        var text: ListItemOrThingOrText?
        var thing: ListItemOrThingOrText?
    }
    
    func testDecode() throws {
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
        
        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.listItem?.listItem?.name, "List Item")
        XCTAssertEqual(testClass.text?.text, "Some Text")
        XCTAssertEqual(testClass.thing?.thing?.name, "A Thing")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let listItem = ListItem()
        listItem.name = "LI 2"
        testObject.listItem = .listItem(value: listItem)
        
        testObject.text = .text(value: "Text 2")
        
        let thing = Thing()
        thing.name = "T 2"
        testObject.thing = .thing(value: thing)
        
        let dictionary = try testObject.asDictionary()
        
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
    
    func testEquatability() throws {
    }
}

