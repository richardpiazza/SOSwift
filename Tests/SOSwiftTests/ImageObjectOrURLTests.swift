import XCTest
@testable import SOSwift

class ImageObjectOrURLTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var imageObject: ImageObjectOrURL?
        var url: ImageObjectOrURL?
        var multiple: [ImageObjectOrURL]?
    }
    
    func testSingleDecodes() throws {
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
        
        let imageObject = (testObject.imageObject as? ImageObjectOrURL)?.imageObject
        let url = (testObject.url as? ImageObjectOrURL)?.url
        
        XCTAssertEqual(imageObject?.name, "Water Bottle")
        XCTAssertEqual(url?.host, "www.squarespace.com")
    }
    
    func testSingleEncodes() throws {
        let testObject = TestClass()
        
        let imageObject = ImageObject()
        imageObject.name = "MacBook"
        testObject.imageObject = .imageObject(value: imageObject)
        
        testObject.url = .url(value: URL(string: "https://www.squareup.com")!)
        
        let dictionary = try testObject.dictionary()
        
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
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "ImageObject",
                    "name" : "Water Bottle"
                },
                "https://www.squarespace.com"
            ]
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        let multiple = testObject.multiple as? [ImageObjectOrURL]
        XCTAssertEqual(multiple?.count, 2)
        
        let imageObject = multiple?[0].imageObject
        let url = multiple?[1].url
        
        XCTAssertEqual(imageObject?.name, "Water Bottle")
        XCTAssertEqual(url?.host, "www.squarespace.com")
    }
    
    func testMultipleEncodes() throws {
        let imageObject = ImageObject()
        imageObject.name = "Water Bottle"
        
        let url = URL(string: "https://www.squarespace.com")!
        
        var multiple = [ImageObjectOrURL]()
        multiple.append(.imageObject(value: imageObject))
        multiple.append(.url(value: url))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.dictionary()
        
        let values = dictionary["multiple"] as? [Any]
        let io = values?[0] as? [String : Any]
        let u = values?[1] as? String
        
        XCTAssertEqual(io?["name"] as? String, "Water Bottle")
        XCTAssertEqual(u, "https://www.squarespace.com")
    }
}

