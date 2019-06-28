import XCTest
@testable import SOSwift

class TextOrThingTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var text: ThingOrText?
        var thing: ThingOrText?
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
                "text" : "Breakfast",
                "thing" : {
                    "@type" : "Thing",
                    "name" : "Cereal"
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
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Breakfast")
        
        guard let thing = testObject.thing as? Thing else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(thing.name, "Cereal")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        testObject.text = .text(value: "Dinner")
        
        let thing = Thing()
        thing.name = "Steak"
        testObject.thing = .thing(value: thing)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let x = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(x, "Dinner")
        
        guard let t = dictionary["thing"] as? [String : Any], let tName = t["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(tName, "Steak")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
