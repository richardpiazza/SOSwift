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
        
        private enum CodingKeys: String, CodingKey {
            case imageObject
            case url
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.imageObject = try container.decodeImageObjectOrURLIfPresent(forKey: .imageObject)
            self.url = try container.decodeImageObjectOrURLIfPresent(forKey: .url)
            self.multiple = try container.decodeIfPresent([SOImageObjectOrURL].self, forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.imageObject, forKey: .imageObject)
            try container.encodeIfPresent(self.url, forKey: .url)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
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
        
        let imageObject = (testObject.imageObject as? SOImageObjectOrURL)?.imageObject
        let url = (testObject.url as? SOImageObjectOrURL)?.url
        
        XCTAssertEqual(imageObject?.name, "Water Bottle")
        XCTAssertEqual(url?.host, "www.squarespace.com")
    }
    
    func testSingleEncodes() throws {
        let testObject = TestClass()
        
        let imageObject = SOImageObject()
        imageObject.name = "MacBook"
        testObject.imageObject = imageObject
        
        testObject.url = URL(string: "https://www.squareup.com")
        
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
        
        let multiple = testObject.multiple as? [SOImageObjectOrURL]
        XCTAssertEqual(multiple?.count, 2)
        
        let imageObject = multiple?[0].imageObject
        let url = multiple?[1].url
        
        XCTAssertEqual(imageObject?.name, "Water Bottle")
        XCTAssertEqual(url?.host, "www.squarespace.com")
    }
    
    func testMultipleEncodes() throws {
        let imageObject = SOImageObject()
        imageObject.name = "Water Bottle"
        
        let url = URL(string: "https://www.squarespace.com")!
        
        var multiple = [SOImageObjectOrURL]()
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

