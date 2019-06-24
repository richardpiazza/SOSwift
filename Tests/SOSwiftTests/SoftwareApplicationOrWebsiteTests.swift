import XCTest
@testable import SOSwift

class SoftwareApplicationOrWebsiteTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var softwareApplication: SoftwareApplicationOrWebsite?
        var website: SoftwareApplicationOrWebsite?
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
        
        let software = SoftwareApplication()
        software.name = "iOS"
        testObject.softwareApplication = .softwareApplication(value: software)
        
        let website = Website()
        website.url = URL(string: "https://www.apple.com/ios")
        testObject.website = .website(value: website)
        
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
