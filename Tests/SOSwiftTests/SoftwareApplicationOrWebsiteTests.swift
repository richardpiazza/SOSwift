@testable import SOSwift
import XCTest

class SoftwareApplicationOrWebsiteTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var softwareApplication: SoftwareApplicationOrWebsite?
        var website: SoftwareApplicationOrWebsite?
    }

    func testDecode() throws {
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

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.softwareApplication?.softwareApplication?.name, "Mac OS X")
        XCTAssertEqual(testObject.website?.website?.url?.host, "www.apple.com")
    }

    func testEncode() throws {
        let testObject = TestClass()

        let software = SoftwareApplication()
        software.name = "iOS"
        testObject.softwareApplication = .softwareApplication(value: software)

        let website = Website()
        website.url = URL(string: "https://www.apple.com/ios")
        testObject.website = .website(value: website)

        let dictionary: [String: Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }

        guard let s = dictionary["softwareApplication"] as? [String: Any], let sName = s["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(sName, "iOS")

        guard let w = dictionary["website"] as? [String: Any], let u = w["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }

        XCTAssertEqual(url.path, "/ios")
    }

    func testEquatability() throws {}
}
