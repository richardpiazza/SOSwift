import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class BrandOrOrganizationTests: XCTestCase {

    fileprivate class Testable: Codable {
        var brand: BrandOrOrganization?
        var organization: BrandOrOrganization?
        var multiple: [BrandOrOrganization]?
        
        private enum CodingKeys: String, CodingKey {
            case brand
            case organization
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.brand = try container.decodeBrandOrOrganizationIfPresent(forKey: .brand)
            self.organization = try container.decodeBrandOrOrganizationIfPresent(forKey: .organization)
            self.multiple = try container.decodeBrandsOrOrganizationsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if let value = self.brand {
                try container.encodeBrandOrOrganization(value, forKey: .brand)
            }
            if let value = self.organization {
                try container.encodeBrandOrOrganization(value, forKey: .organization)
            }
            if let value = self.multiple {
                try container.encodeBrandsOrOrganizations(value, forKey: .multiple)
            }
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

    func testSingleDecode() {
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
        
        let testable: Testable
        do {
            testable = try JSONDecoder().decode(Testable.self, from: data)
        } catch {
            XCTFail()
            return
        }
        
        guard let brand = testable.brand as? SOBrand else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(brand.name, "Brand")
        
        guard let organization = testable.organization as? SOOrganization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(organization.name, "Organization")
    }
    
    func testSingleEncode() {
        let testable = Testable()
        testable.brand = SOBrand()
        testable.organization = SOOrganization()
        
        let data: Data
        do {
            data = try JSONEncoder().encode(testable)
        } catch {
            XCTFail()
            return
        }
        
        guard let json = String(data: data, encoding: .utf8) else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(json.contains("\"brand\":{\"@context\":\"http:\\/\\/www.schema.org\",\"@type\":\"Brand\"}"))
        XCTAssertTrue(json.contains("\"organization\":{\"@context\":\"http:\\/\\/www.schema.org\",\"@type\":\"Organization\"}"))
    }
    
    func testMultipleDecode() {
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
        
        let testable: Testable
        do {
            testable = try JSONDecoder().decode(Testable.self, from: data)
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = testable.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        guard let brand = multiple[0] as? SOBrand else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(brand.name, "Brand")
        
        guard let organization = multiple[1] as? SOOrganization else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(organization.name, "Organization")
    }
}
