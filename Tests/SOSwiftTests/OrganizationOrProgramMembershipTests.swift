import XCTest
@testable import SOSwift

class OrganizationOrProgramMembershipTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var organization: OrganizationOrProgramMembership?
        var programMembership: OrganizationOrProgramMembership?
        var multiple: [OrganizationOrProgramMembership]?
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
        
        let org = Organization()
        org.name = "Microsoft"
        testObject.organization = .organization(value: org)
        
        let prog = ProgramMembership()
        prog.name = "Insider"
        testObject.programMembership = .programMembership(value: prog)
        
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
        
        let org = Organization()
        org.name = "Microsoft"
        
        let prog = ProgramMembership()
        prog.name = "Insider"
        
        testObject.multiple = [.organization(value: org), .programMembership(value: prog)]
        
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
