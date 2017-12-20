import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ImageObjectOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var imageObject: ImageObjectOrURL?
        var url: ImageObjectOrURL?
        
        private enum CodingKeys: String, CodingKey {
            case imageObject
            case url
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.imageObject = try container.decodeImageObjectOrURLIfPresent(forKey: .imageObject)
            self.url = try container.decodeImageObjectOrURLIfPresent(forKey: .url)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.imageObject, forKey: .imageObject)
            try container.encodeIfPresent(self.url, forKey: .url)
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
                "imageObject" : {
                    "@type" : "ImageObject",
                    "name" : "Water Bottle"
                },
                "url" : "https://www.squarespace.com"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let imageObject = testObject.imageObject as? ImageObject else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(imageObject.name, "Water Bottle")
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.squarespace.com")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let imageObject = SOImageObject()
        imageObject.name = "MacBook"
        testObject.imageObject = imageObject
        
        testObject.url = URL(string: "https://www.squareup.com")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
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
}

