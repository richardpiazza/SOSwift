import XCTest
import SOSwiftVocabulary
@testable import SOSwift

class DataTypeTests: XCTestCase {
    
    let thing = SOThing()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// Test the `CreativeWorkOrURL` data type
    /// - CreativeWork
    /// - URL
    func testCreativeWorkOrURL() {
        let dictionary: [String : AnyObject] = [
            SOThing.Keys.type : SOCreativeWork.type as AnyObject,
            SOCreativeWork.Keys.headline : "Modern Art?" as AnyObject
        ]
        let dictionaryTest = thing.makeCreativeWorkOrURL(anyObject: dictionary as AnyObject)
        XCTAssertNotNil(dictionaryTest)
        XCTAssertTrue(dictionaryTest is SOCreativeWork)
        XCTAssertTrue((dictionaryTest as! SOCreativeWork).headline == "Modern Art?")
        
        let url = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
        let urlTest = thing.makeCreativeWorkOrURL(anyObject: url as AnyObject)
        XCTAssertTrue(urlTest is URL)
        XCTAssertTrue((urlTest as! URL).lastPathComponent == "googlelogo_color_272x92dp.png")
        
        let invalid = ""
        let invalidTest = thing.makeCreativeWorkOrURL(anyObject: invalid as AnyObject)
        XCTAssertNil(invalidTest)
    }
    
    /// Test the `Identifier` data type
    /// - PropertyValue
    /// - String
    /// - URL
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
    
    /// Test the `ImageObectOrURL` data type
    /// - ImageObject
    /// - URL
    func testImageObjectOrURL() {
        let dictionary: [String : AnyObject] = [
            SOThing.Keys.type : SOImageObject.type as AnyObject,
            SOImageObject.Keys.caption : "An Image Caption" as AnyObject
        ]
        let url = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
        let invalid = ""
        
        let dictionaryTest = thing.makeImageObjectOrURL(anyObject: dictionary as AnyObject)
        XCTAssertNotNil(dictionaryTest)
        XCTAssertTrue(dictionaryTest is SOImageObject)
        XCTAssertTrue((dictionaryTest as! SOImageObject).caption == "An Image Caption")
        
        let urlTest = thing.makeImageObjectOrURL(anyObject: url as AnyObject)
        XCTAssertNotNil(urlTest)
        XCTAssertTrue(urlTest is URL)
        XCTAssertTrue((urlTest as! URL).lastPathComponent == "googlelogo_color_272x92dp.png")
        
        let invalidTest = thing.makeImageObjectOrURL(anyObject: invalid as AnyObject)
        XCTAssertNil(invalidTest)
    }
}
