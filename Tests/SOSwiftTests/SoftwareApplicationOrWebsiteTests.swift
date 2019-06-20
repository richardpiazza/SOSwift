import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class SoftwareApplicationOrWebsiteTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var softwareApplication: SoftwareApplicationOrWebsite?
        var website: SoftwareApplicationOrWebsite?
        
        private enum CodingKeys: String, CodingKey {
            case softwareApplication
            case website
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.softwareApplication = try container.decodeSoftwareApplicationOrWebsiteIfPresent(forKey: .softwareApplication)
            self.website = try container.decodeSoftwareApplicationOrWebsiteIfPresent(forKey: .website)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.softwareApplication, forKey: .softwareApplication)
            try container.encodeIfPresent(self.website, forKey: .website)
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
                "softwareApplication" : {
                    "@type" : "SoftwareApplication",
                    "name" : "Mac OS X"
                },
                "website" : {
                    "@type" : "Website",
                    "url" : "https://www.apple.com/macos"
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
        
        guard let softwareApplication = testObject.softwareApplication as? SoftwareApplication else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(softwareApplication.name, "Mac OS X")
        
        guard let website = testObject.website as? Website else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(website.url?.host, "www.apple.com")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let software = SOSoftwareApplication()
        software.name = "iOS"
        testObject.softwareApplication = software
        
        let website = SOWebsite()
        website.url = URL(string: "https://www.apple.com/ios")
        testObject.website = website
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let s = dictionary["softwareApplication"] as? [String : Any], let sName = s["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sName, "iOS")
        
        guard let w = dictionary["website"] as? [String : Any], let u = w["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.path, "/ios")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
