import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class EducationalOrganizationOrOrganizationTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var educationalOrganization: EducationalOrganizationOrOrganization?
        var organization: EducationalOrganizationOrOrganization?
        var multiple: [EducationalOrganizationOrOrganization]?
        
        private enum CodingKeys: String, CodingKey {
            case educationalOrganization
            case organization
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.educationalOrganization = try container.decodeEducationalOrganizationOrOrganizationIfPresent(forKey: .educationalOrganization)
            self.organization = try container.decodeEducationalOrganizationOrOrganizationIfPresent(forKey: .organization)
            self.multiple = try container.decodeEducationalOrganizationsOrOrganizationsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(educationalOrganization, forKey: .educationalOrganization)
            try container.encodeIfPresent(organization, forKey: .organization)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
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
        
        guard let edOrg = (testObject.educationalOrganization as? SOEducationalOrganizationOrOrganization)?.educationalOrganization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(edOrg.name, "Harvard")
        
        guard let org = (testObject.organization as? SOEducationalOrganizationOrOrganization)?.organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(org.name, "Microsoft")
    }
    
    func testSingleEncodes() throws {
        let testObject = TestClass()
        
        let edOrg = SOEducationalOrganization()
        edOrg.name = "Yale"
        testObject.educationalOrganization = edOrg
        
        let org = SOOrganization()
        org.name = "Bob's"
        testObject.organization = org
        
        let dictionary = try testObject.dictionary()
        
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
        
        guard let educationOrganization = (multiple[0] as? SOEducationalOrganizationOrOrganization)?.educationalOrganization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(educationOrganization.name, "Harvard")
        
        guard let organization = (multiple[1] as? SOEducationalOrganizationOrOrganization)?.organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(organization.name, "Microsoft")
    }
    
    func testMultipleEncodes() throws {
        let educationalOrganization = SOEducationalOrganization()
        educationalOrganization.name = "Harvard"
        
        let organization = SOOrganization()
        organization.name = "Microsoft"
        
        var multiple: [SOEducationalOrganizationOrOrganization] = []
        multiple.append(.educationalOrganization(value: educationalOrganization))
        multiple.append(.organization(value: organization))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.dictionary()
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
