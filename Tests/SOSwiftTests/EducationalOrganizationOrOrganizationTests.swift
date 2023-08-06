import XCTest
@testable import SOSwift

class EducationalOrganizationOrOrganizationTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var educationalOrganization: EducationalOrganizationOrOrganization?
        var organization: EducationalOrganizationOrOrganization?
        var multiple: [EducationalOrganizationOrOrganization]?
    }
    
    func testSingleDecodes() throws {
        let json = """
        {
            "educationalOrganization" : {
                "@type" : "EducationalOrganization",
                "name" : "Harvard"
            },
            "organization" : {
                "@type" : "Organization",
                "name" : "Microsoft"
            }
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        guard let edOrg = testObject.educationalOrganization?.educationalOrganization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(edOrg.name, "Harvard")
        
        guard let org = testObject.organization?.organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(org.name, "Microsoft")
    }
    
    func testSingleEncodes() throws {
        let testObject = TestClass()
        
        let edOrg = EducationalOrganization()
        edOrg.name = "Yale"
        testObject.educationalOrganization = .educationalOrganization(value: edOrg)
        
        let org = Organization()
        org.name = "Bob's"
        testObject.organization = .organization(value: org)
        
        let dictionary = try testObject.asDictionary()
        
        guard let eO = dictionary["educationalOrganization"] as? [String : Any] else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(eO["name"] as? String, "Yale")
        
        guard let o = dictionary["organization"] as? [String : Any] else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(o["name"] as? String, "Bob's")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "EducationalOrganization",
                    "name" : "Harvard"
                },
                {
                    "@type" : "Organization",
                    "name" : "Microsoft"
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
        
        guard let educationOrganization = multiple[0].educationalOrganization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(educationOrganization.name, "Harvard")
        
        guard let organization = multiple[1].organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(organization.name, "Microsoft")
    }
    
    func testMultipleEncodes() throws {
        let educationalOrganization = EducationalOrganization()
        educationalOrganization.name = "Harvard"
        
        let organization = Organization()
        organization.name = "Microsoft"
        
        var multiple: [EducationalOrganizationOrOrganization] = []
        multiple.append(.educationalOrganization(value: educationalOrganization))
        multiple.append(.organization(value: organization))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.asDictionary()
        XCTAssertEqual(dictionary.keys.count, 1)
        
        guard let values = dictionary["multiple"] as? [[String : Any]] else {
            XCTFail()
            return
        }
        
        let eo = values[0]
        let o = values[1]
        
        XCTAssertEqual(eo["name"] as? String, "Harvard")
        XCTAssertEqual(o["name"] as? String, "Microsoft")
    }
}
