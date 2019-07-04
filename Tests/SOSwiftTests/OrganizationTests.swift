import XCTest
@testable import SOSwift

class OrganizationTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static var organization: Organization {
        let organization = Organization()
        
        return organization
    }
    
    func testSchema() throws {
        XCTAssertEqual(Organization.schemaType, "Organization")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        let organization = try Organization.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try OrganizationTests.organization.asDictionary()
        
    }
    
}
