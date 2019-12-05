import XCTest
@testable import SOSwift

class CountryOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var country: CountryOrText?
        var text: CountryOrText?
        var multiple: [CountryOrText]?
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
            "country" : {
                "@type" : "Country",
                "name" : "Poland"
            },
            "text" : "United States"
        }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let country = testObject.country else {
            XCTFail()
            return
        }
        
        switch country {
        case .country(let value):
            XCTAssertEqual(value.name, "Poland")
        default:
            XCTFail()
        }
        
        guard let text = testObject.text else {
            XCTFail()
            return
        }
        
        switch text {
        case .text(let value):
            XCTAssertEqual(value, "United States")
        default:
            XCTFail()
        }
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let country = Country()
        country.name = "Germany"
        
        testObject.country = .country(value: country)
        testObject.text = .text(value: "South America")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.asDictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let c = dictionary["country"] as? [String : Any], let germany = c["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(germany, "Germany")
        
        guard let sa = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sa, "South America")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "Country",
                    "name" : "Poland"
                },
                "United States"
            ]
        }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable: TestClass = try JSONDecoder().decode(TestClass.self, from: data)
        
        guard let multiple = testable.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        let country = multiple[0]
        
        switch country {
        case .country(let value):
            XCTAssertEqual(value.name, "Poland")
        default:
            XCTFail()
        }
        
        let text = multiple[1]
        
        switch text {
        case .text(let value):
            XCTAssertEqual(value, "United States")
        default:
            XCTFail()
        }
    }
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        testable.multiple = [.country(value: Country()), .text(value: "Hero")]
        
        let json = try testable.asJSON()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
