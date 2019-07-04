import XCTest
@testable import SOSwift

class BrandOrOrganizationTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var brand: BrandOrOrganization?
        var organization: BrandOrOrganization?
    }
    
    func testDecode() throws {
        let json = """
        {
            "brand" : {
                "@type" : "Brand",
                "name" : "Brand"
            },
            "organization" : {
                "@type" : "Organization",
                "name" : "Organization"
            }
        }
        """
        
        let testClass = try TestClass.make(with: json)
        
        XCTAssertEqual(testClass.brand?.brand?.name, "Brand")
        XCTAssertNil(testClass.brand?.organization)
        XCTAssertEqual(testClass.organization?.organization?.name, "Organization")
        XCTAssertNil(testClass.organization?.brand)
    }
    
    func testEncode() throws {
        let testClass = TestClass()
        testClass.brand = BrandOrOrganization(Brand())
        testClass.organization = BrandOrOrganization(Organization())
        
        let dictionary = try testClass.asDictionary()
        
        XCTAssertNotNil(dictionary["brand"] as? [String : Any])
        XCTAssertNotNil(dictionary["organization"] as? [String : Any])
    }
}
