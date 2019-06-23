import XCTest
@testable import SOSwift

class PersonOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var person: PersonOrURL?
        var url: PersonOrURL?
        var multiple: [PersonOrURL]?
        
        private enum CodingKeys: String, CodingKey {
            case person
            case url
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.person = try container.decodePersonOrURLIfPresent(forKey: .person)
            self.url = try container.decodePersonOrURLIfPresent(forKey: .url)
            self.multiple = try container.decodePersonsOrURLsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.person, forKey: .person)
            try container.encodeIfPresent(self.url, forKey: .url)
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
                "person" : {
                    "@type" : "Person",
                    "name" : "Richard"
                },
                "url" : "https://www.richardpiazza.com"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let person = testObject.person as? Person else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(person.name, "Richard")
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.richardpiazza.com")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let person = Person()
        person.name = "Jon Snow"
        testObject.person = person
        
        testObject.url = URL(string: "https://en.wikipedia.org/wiki/Jon_Snow_(character)")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let p = dictionary["person"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Jon Snow")
        
        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "en.wikipedia.org")
    }
    
    func testMultipleDecodes() {
        let json = """
            {
                "multiple" : [
                    {
                        "@type" : "Person",
                        "name" : "Richard"
                    },
                    "https://www.richardpiazza.com"
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
        
        guard let person = multiple[0] as? Person else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(person.name, "Richard")
        
        guard let url = multiple[1] as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.richardpiazza.com")
    }
    
    func testMultipleEncodes() {
        let testObject = TestClass()
        
        let person = Person()
        person.name = "Jon Snow"
        
        let wiki = URL(string: "https://en.wikipedia.org/wiki/Jon_Snow_(character)")!
        
        testObject.multiple = [person, wiki]
        
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
        
        guard let p = multiple[0] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Jon Snow")
        
        guard let u = multiple[1] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "en.wikipedia.org")
    }
}
