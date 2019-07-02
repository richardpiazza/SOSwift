import XCTest
@testable import SOSwift

class BrandOrOrganizationTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var brand: BrandOrOrganization?
        var organization: BrandOrOrganization?
        var multiple: [BrandOrOrganization]?
    }
    
    func testSingleDecodes() {
        let json = """
            {
                "brand" : {
                    "@type" : "Brand",
                    "name" : "Brand"
                },
                "organization" : {
                    "@type" : "Organization",
                    "name" : "Organization"
                }
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable: TestClass
        do {
            testable = try JSONDecoder().decode(TestClass.self, from: data)
        } catch {
            XCTFail()
            return
        }
        
        let brand = testable.brand?.brand
        XCTAssertEqual(brand?.name, "Brand")
        
        let organization = testable.organization?.organization
        XCTAssertEqual(organization?.name, "Organization")
    }
    
    func testSingleEncodes() {
        let testable = TestClass()
        testable.brand = BrandOrOrganization.brand(value: Brand())
        testable.organization = BrandOrOrganization.organization(value: Organization())
        
        let json: String
        do {
            json = try testable.json()
        } catch {
            XCTFail()
            return
        }
        
        XCTAssertTrue(json.contains("\"brand\":{\"@context\":\"http:\\/\\/www.schema.org\",\"@type\":\"Brand\"}"))
        XCTAssertTrue(json.contains("\"organization\":{\"@context\":\"http:\\/\\/www.schema.org\",\"@type\":\"Organization\"}"))
    }
    
    func testMultipleDecodes() {
        let json = """
            {
                "multiple" : [
                    {
                        "@type" : "Brand",
                        "name" : "Brand"
                    },
                    {
                        "@type" : "Organization",
                        "name" : "Organization"
                    }
                ]
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable: TestClass
        do {
            testable = try JSONDecoder().decode(TestClass.self, from: data)
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = testable.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        guard let brand = multiple[0] as? BrandOrOrganization else {
            XCTFail()
            return
        }
        
        switch brand {
        case .organization:
            XCTFail()
        case .brand(let value):
            XCTAssertEqual(value.name, "Brand")
        }
        
        guard let organization = multiple[1] as? BrandOrOrganization else {
            XCTFail()
            return
        }
        
        switch organization {
        case .brand:
            XCTFail()
        case .organization(let value):
            XCTAssertEqual(value.name, "Organization")
        }
    }
    
    func testMultipleEncodes() {
        let testable = TestClass()
        let brand = Brand()
        brand.name = "A Brand"
        let organization = Organization()
        organization.name = "An Organization"
        testable.multiple = [.brand(value: brand), .organization(value: organization)]
        
        let json: String
        do {
            json = try testable.json()
        } catch {
            XCTFail()
            return
        }
        
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
