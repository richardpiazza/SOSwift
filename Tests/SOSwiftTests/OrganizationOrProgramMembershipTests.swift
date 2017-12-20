import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class OrganizationOrProgramMembershipTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var organization: OrganizationOrProgramMembership?
        var programMembership: OrganizationOrProgramMembership?
        var multiple: [OrganizationOrProgramMembership]?
        
        private enum CodingKeys: String, CodingKey {
            case organization
            case programMembership
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.organization = try container.decodeOrganizationOrProgramMembershipIfPresent(forKey: .organization)
            self.programMembership = try container.decodeOrganizationOrProgramMembershipIfPresent(forKey: .programMembership)
            self.multiple = try container.decodeOrganizationsOrProgramMembershipsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.organization, forKey: .organization)
            try container.encodeIfPresent(self.programMembership, forKey: .programMembership)
            try container.encodeIfPresent(self.multiple, forKey: .multiple)
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
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let org = testObject.organization as? Organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(org.name, "Apple")
        
        guard let programMembership = testObject.programMembership as? ProgramMembership else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(programMembership.name, "Apple Care")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let org = SOOrganization()
        org.name = "Microsoft"
        testObject.organization = org
        
        let prog = SOProgramMembership()
        prog.name = "Insider"
        testObject.programMembership = prog
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
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
    
    func testMultipleDecodes() {
        let json = """
            {
                "multiple" : [
                    {
                        "@type" : "Organization",
                        "name" : "Apple"
                    },
                    {
                        "@type" : "ProgramMembership",
                        "name" : "Apple Care"
                    }
                ]
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = testObject.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        guard let org = multiple[0] as? Organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(org.name, "Apple")
        
        guard let programMembership = multiple[1] as? ProgramMembership else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(programMembership.name, "Apple Care")
    }
    
    func testMultipleEncodes() {
        let testObject = TestClass()
        
        let org = SOOrganization()
        org.name = "Microsoft"
        
        let prog = SOProgramMembership()
        prog.name = "Insider"
        
        testObject.multiple = [org, prog]
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = dictionary["multiple"] as? [Any] else {
            XCTFail()
            return
        }
        
        guard let o = multiple[0] as? [String : Any], let oName = o["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(oName, "Microsoft")
        
        guard let p = multiple[1] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Insider")
    }
}
