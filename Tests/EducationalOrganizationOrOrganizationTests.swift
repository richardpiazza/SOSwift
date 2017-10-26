import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class EducationalOrganizationOrOrganizationTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var educationalOrganization: EducationalOrganizationOrOrganization?
        var organization: EducationalOrganizationOrOrganization?
        
        private enum CodingKeys: String, CodingKey {
            case educationalOrganization
            case organization
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.educationalOrganization = try container.decodeEducationalOrganizationOrOrganizationIfPresent(forKey: .educationalOrganization)
            self.organization = try container.decodeEducationalOrganizationOrOrganizationIfPresent(forKey: .organization)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.educationalOrganization, forKey: .educationalOrganization)
            try container.encodeIfPresent(self.organization, forKey: .organization)
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
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let edOrg = testObject.educationalOrganization as? EducationalOrganization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(edOrg.name, "Harvard")
        
        guard let org = testObject.organization  as? Organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(org.name, "Microsoft")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let edOrg = SOEducationalOrganization()
        edOrg.name = "Yale"
        testObject.educationalOrganization = edOrg
        
        let org = SOOrganization()
        org.name = "Bob's"
        testObject.organization = org
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let eO = dictionary["educationalOrganization"] as? [String : Any], let eoName = eO["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(eoName, "Yale")
        
        guard let o = dictionary["organization"] as? [String : Any], let oName = o["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(oName, "Bob's")
    }
}
