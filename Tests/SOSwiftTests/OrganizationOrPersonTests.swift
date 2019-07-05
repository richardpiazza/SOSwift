import XCTest
@testable import SOSwift

class OrganizationOrPersonTests: XCTestCase {
    
    static var allTests = [
        ("testDecode", testDecode),
        ("testEncode", testEncode),
        ("testEquatability", testEquatability),
    ]
    
    fileprivate class TestClass: Codable, Schema {
        var organization: OrganizationOrPerson?
        var person: OrganizationOrPerson?
        var multiple: [OrganizationOrPerson]?
    }
    
    func testDecode() throws {
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
        
        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.organization?.organization?.name, "Apple")
        XCTAssertEqual(testObject.person?.person?.name, "Tim Cook")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let org = Organization()
        org.name = "Microsoft"
        testObject.organization = .organization(value: org)
        
        let person = Person()
        person.name = "Satyamania"
        testObject.person = .person(value: person)
        
        let dictionary = try testObject.asDictionary()
        
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
    
    func testEquatability() throws {
    }
}
