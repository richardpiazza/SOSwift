import XCTest
@testable import SOSwift

class OrganizationOrProgramMembershipTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var organization: OrganizationOrProgramMembership?
        var programMembership: OrganizationOrProgramMembership?
        var multiple: [OrganizationOrProgramMembership]?
    }
    
    func testDecode() throws {
        let json = """
        {
            "organization" : {
                "@type" : "Organization",
                "name" : "Apple"
            },
            "programMembership" : {
                "@type" : "ProgramMembership",
                "name" : "Apple Care"
            }
        }
        """
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.organization?.organization?.name, "Apple")
        XCTAssertEqual(testObject.programMembership?.programMembership?.name, "Apple Care")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let org = Organization()
        org.name = "Microsoft"
        testObject.organization = .organization(value: org)
        
        let prog = ProgramMembership()
        prog.name = "Insider"
        testObject.programMembership = .programMembership(value: prog)
        
        let dictionary = try testObject.asDictionary()
        
        guard let o = dictionary["organization"] as? [String : Any], let oName = o["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(oName, "Microsoft")
        
        guard let p = dictionary["programMembership"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Insider")
    }
    
    func testEquatability() throws {
    }
}
