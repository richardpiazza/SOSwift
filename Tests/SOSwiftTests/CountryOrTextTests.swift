import XCTest
@testable import SOSwift

class CountryOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var country: CountryOrText?
        var text: CountryOrText?
        var multiple: [CountryOrText]?
    }
    
    func testSingleDecodes() throws {
        let json = """
        {
            "country" : {
                "@type" : "Country",
                "name" : "Poland"
            },
            "text" : "United States"
        }
        """
        
        let testObject: TestClass = try TestClass.make(with: json)
        
        let country = try XCTUnwrap(testObject.country)
        XCTAssertEqual(country.country?.name, "Poland")
        
        let text = try XCTUnwrap(testObject.text)
        XCTAssertEqual(text.text, "United States")
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
        XCTAssertEqual(country.country?.name, "Poland")
        
        let text = multiple[1]
        XCTAssertEqual(text.text, "United States")
    }
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        testable.multiple = [.country(value: Country()), .text(value: "Hero")]
        
        let json = try testable.asJSON()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
