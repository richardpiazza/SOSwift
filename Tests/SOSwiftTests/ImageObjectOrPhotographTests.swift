import XCTest
@testable import SOSwift

class ImageObjectOrPhotographTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var imageObject: ImageObjectOrPhotograph?
        var photograph: ImageObjectOrPhotograph?
        var multiple: [ImageObjectOrPhotograph]?
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
        
        guard let imageObject = testObject.imageObject?.imageObject else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(imageObject.name, "An Image")
        
        guard let photo = testObject.photograph?.photograph else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(photo.name, "Photo")
    }
    
    func testSingleEncodes() throws {
        let testObject = TestClass()
        
        let imageObject = ImageObject()
        imageObject.name = "Wacky"
        testObject.imageObject = .imageObject(value: imageObject)
        
        let photo = Photograph()
        photo.name = "Taffy"
        testObject.photograph = .photograph(value: photo)
        
        let dictionary = try testObject.asDictionary()
        
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
        
        guard let multiple = testObject.multiple else {
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
        let imageObject = ImageObject()
        imageObject.name = "Fruit Plate"
        
        let photograph = Photograph()
        photograph.name = "Cheese Board"
        
        var multiple = [ImageObjectOrPhotograph]()
        multiple.append(.imageObject(value: imageObject))
        multiple.append(.photograph(value: photograph))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.asDictionary()
        
        let values = dictionary["multiple"] as? [[String : Any]]
        XCTAssertEqual(values?.count, 2)
        
        let io = values?[0]
        let p = values?[1]
        
        XCTAssertEqual(io?["name"] as? String, "Fruit Plate")
        XCTAssertEqual(p?["name"] as? String, "Cheese Board")
    }
}
