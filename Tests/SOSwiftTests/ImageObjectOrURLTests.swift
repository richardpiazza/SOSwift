import XCTest
@testable import SOSwift

class ImageObjectOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var imageObject: ImageObjectOrURL?
        var url: ImageObjectOrURL?
        var multiple: [ImageObjectOrURL]?
    }
    
    func testDecode() throws {
        let json = """
        {
            "imageObject" : {
                "@type" : "ImageObject",
                "name" : "Water Bottle"
            },
            "url" : "https://www.squarespace.com"
        }
        """
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.imageObject?.imageObject?.name, "Water Bottle")
        XCTAssertEqual(testObject.url?.url?.host, "www.squarespace.com")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let imageObject = ImageObject()
        imageObject.name = "MacBook"
        testObject.imageObject = .imageObject(value: imageObject)
        
        testObject.url = .url(value: URL(string: "https://www.squareup.com")!)
        
        let dictionary = try testObject.asDictionary()
        
        guard let io = dictionary["imageObject"] as? [String : Any], let ioName = io["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(ioName, "MacBook")
        
        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.squareup.com")
    }
    
    func testEquatability() throws {
    }
}

