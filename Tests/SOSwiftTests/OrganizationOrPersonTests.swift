import XCTest
@testable import SOSwift

class OrganizationOrPersonTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var organization: OrganizationOrPerson?
        var person: OrganizationOrPerson?
        var multiple: [OrganizationOrPerson]?
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
        
        guard let org = testObject.organization?.organization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(org.name, "Apple")
        
        guard let person = testObject.person?.person else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(person.name, "Tim Cook")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let org = Organization()
        org.name = "Microsoft"
        testObject.organization = org
        
        let person = Person()
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
        
        let org = Organization()
        org.name = "Microsoft"
        
        let person = Person()
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
