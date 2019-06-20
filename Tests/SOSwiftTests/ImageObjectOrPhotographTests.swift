import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ImageObjectOrPhotographTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var imageObject: ImageObjectOrPhotograph?
        var photograph: ImageObjectOrPhotograph?
        var multiple: [ImageObjectOrPhotograph]?
        
        private enum CodingKeys: String, CodingKey {
            case imageObject
            case photograph
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.imageObject = try container.decodeImageObjectOrPhotographIfPresent(forKey: .imageObject)
            self.photograph = try container.decodeImageObjectOrPhotographIfPresent(forKey: .photograph)
            self.multiple = try container.decodeImageObjectsOrPhotographsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.imageObject, forKey: .imageObject)
            try container.encodeIfPresent(self.photograph, forKey: .photograph)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
    }
    
    func testSingleDecodes() throws {
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
        
        let testObject = try TestClass.make(with: json)
        
        guard let imageObject = (testObject.imageObject as? SOImageObjectOrPhotograph)?.imageObject else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(imageObject.name, "An Image")
        
        guard let photo = (testObject.photograph as? SOImageObjectOrPhotograph)?.photograph else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(photo.name, "Photo")
    }
    
    func testSingleEncodes() throws {
        let testObject = TestClass()
        
        let imageObject = SOImageObject()
        imageObject.name = "Wacky"
        testObject.imageObject = imageObject
        
        let photo = SOPhotograph()
        photo.name = "Taffy"
        testObject.photograph = photo
        
        let dictionary = try testObject.dictionary()
        
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
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "ImageObject",
                    "name" : "An Image"
                },
                {
                    "@type" : "Photograph",
                    "name" : "Photo"
                }
            ]
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        guard let multiple = testObject.multiple as? [SOImageObjectOrPhotograph] else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        let imageObject = multiple[0].imageObject
        let photograph = multiple[1].photograph
        
        XCTAssertEqual(imageObject?.name, "An Image")
        XCTAssertEqual(photograph?.name, "Photo")
    }
    
    func testMultipleEncodes() throws {
        let imageObject = SOImageObject()
        imageObject.name = "Fruit Plate"
        
        let photograph = SOPhotograph()
        photograph.name = "Cheese Board"
        
        var multiple = [SOImageObjectOrPhotograph]()
        multiple.append(.imageObject(value: imageObject))
        multiple.append(.photograph(value: photograph))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.dictionary()
        
        let values = dictionary["multiple"] as? [[String : Any]]
        XCTAssertEqual(values?.count, 2)
        
        let io = values?[0]
        let p = values?[1]
        
        XCTAssertEqual(io?["name"] as? String, "Fruit Plate")
        XCTAssertEqual(p?["name"] as? String, "Cheese Board")
    }
}
