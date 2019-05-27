import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class CountryOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var country: CountryOrText?
        var text: CountryOrText?
        var multiple: [CountryOrText]?
        
        private enum CodingKeys: String, CodingKey {
            case country
            case text
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.country = try container.decodeCountryOrTextIfPresent(forKey: .country)
            self.text = try container.decodeCountryOrTextIfPresent(forKey: .text)
            self.multiple = try container.decodeCountriesOrTextsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.country, forKey: .country)
            try container.encodeIfPresent(self.text, forKey: .text)
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
        
        guard let country = testObject.country as? SOCountryOrText else {
            XCTFail()
            return
        }
        
        switch country {
        case .country(let value):
            XCTAssertEqual(value.name, "Poland")
        default:
            XCTFail()
        }
        
        guard let text = testObject.text as? SOCountryOrText else {
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
        
        let country = SOCountry()
        country.name = "Germany"
        
        testObject.country = country
        testObject.text = "South America"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
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
        
        guard let country = multiple[0] as? SOCountryOrText else {
            XCTFail()
            return
        }
        
        switch country {
        case .country(let value):
            XCTAssertEqual(value.name, "Poland")
        default:
            XCTFail()
        }
        
        guard let text = multiple[1] as? SOCountryOrText else {
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
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        testable.multiple = [SOCountry(), "Hero"]
        
        let json = try testable.json()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
