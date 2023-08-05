import XCTest
@testable import SOSwift

class OrganizationTests: XCTestCase {
    
    public static var organization: Organization {
        let organization = Organization()
        
        return organization
    }
    
    func testSchema() throws {
        XCTAssertEqual(Organization.schemaName, "Organization")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        _ = try Organization.make(with: json)
    }
    
    func testEncode() throws {
        _ = try OrganizationTests.organization.asDictionary()
    }
    
}
