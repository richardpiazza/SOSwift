import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class OrganizationOrPersonTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var organization: OrganizationOrPerson?
        var person: OrganizationOrPerson?
        var multiple: [OrganizationOrPerson]?
        
        private enum CodingKeys: String, CodingKey {
            case organization
            case person
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.organization = try container.decodeOrganizationOrPersonIfPresent(forKey: .organization)
            self.person = try container.decodeOrganizationOrPersonIfPresent(forKey: .person)
            self.multiple = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.organization, forKey: .organization)
            try container.encodeIfPresent(self.person, forKey: .person)
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
                "person" : {
                    "@type" : "Person",
                    "name" : "Tim Cook"
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
        
        guard let person = testObject.person as? Person else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(person.name, "Tim Cook")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let org = SOOrganization()
        org.name = "Microsoft"
        testObject.organization = org
        
        let person = SOPerson()
        person.name = "Satyamania"
        testObject.person = person
        
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
        
        guard let p = dictionary["person"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Satyamania")
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
                        "@type" : "Person",
                        "name" : "Tim Cook"
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
        
        guard let person = multiple[1] as? Person else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(person.name, "Tim Cook")
    }
    
    func testMultipleEncodes() {
        let testObject = TestClass()
        
        let org = SOOrganization()
        org.name = "Microsoft"
        
        let person = SOPerson()
        person.name = "Satyamania"
        
        testObject.multiple = [org, person]
        
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
        
        XCTAssertEqual(pName, "Satyamania")
    }
}
