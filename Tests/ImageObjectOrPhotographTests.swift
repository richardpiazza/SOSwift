import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ImageObjectOrPhotographTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var imageObject: ImageObjectOrPhotograph?
        var photograph: ImageObjectOrPhotograph?
        
        private enum CodingKeys: String, CodingKey {
            case imageObject
            case photograph
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.imageObject = try container.decodeImageObjectOrPhotographIfPresent(forKey: .imageObject)
            self.photograph = try container.decodeImageObjectOrPhotographIfPresent(forKey: .photograph)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.imageObject, forKey: .imageObject)
            try container.encodeIfPresent(self.photograph, forKey: .photograph)
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
                    "name" : "An Image"
                },
                "photograph" : {
                    "@type" : "Photograph",
                    "name" : "Photo"
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
        
        guard let imageObject = testObject.imageObject as? ImageObject else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(imageObject.name, "An Image")
        
        guard let photo = testObject.photograph as? Photograph else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(photo.name, "Photo")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let imageObject = SOImageObject()
        imageObject.name = "Wacky"
        testObject.imageObject = imageObject
        
        let photo = SOPhotograph()
        photo.name = "Taffy"
        testObject.photograph = photo
        
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
        
        XCTAssertEqual(ioName, "Wacky")
        
        guard let p = dictionary["photograph"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Taffy")
    }
}

