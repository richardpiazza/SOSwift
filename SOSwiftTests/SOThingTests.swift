import XCTest
@testable import SOSwift

class SOThingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIdentifier() {
        let urlIdentifier = "{\"identifier\":\"http://schema.org/Thing\"}"
        var thing = SOThing(json: urlIdentifier)
        XCTAssertNotNil(thing.identifier as? URL)
        XCTAssertTrue(thing.dictionary[SOThing.Keys.id] as? String == "http://schema.org/Thing")
        
        let stringIdentifier = "{\"identifier\":\"12345\"}"
        thing = SOThing(json: stringIdentifier)
        XCTAssertNotNil(thing.identifier as? String)
        XCTAssertTrue(thing.dictionary[SOThing.Keys.id] as? String == "12345")
        
        let propertyValueIdentifier = "{\"identifier\":{\"@type\":\"PropertyValue\",\"value\":\"12345\"}}"
        thing = SOThing(json: propertyValueIdentifier)
        XCTAssertNotNil(thing.identifier as? PropertyValue)
        let pv = thing.dictionary[SOThing.Keys.id] as? [String : AnyObject]
        XCTAssertTrue(pv?["value"] as? String == "12345")
    }
}
