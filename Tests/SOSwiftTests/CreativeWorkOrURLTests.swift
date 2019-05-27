import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class CreativeWorkOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrURL?
        var url: CreativeWorkOrURL?
        var multiple: [CreativeWorkOrURL]?
        
        private enum CodingKeys: String, CodingKey {
            case creativeWork
            case url
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            creativeWork = try container.decodeCreativeWorkOrURLIfPresent(forKey: .creativeWork)
            url = try container.decodeCreativeWorkOrURLIfPresent(forKey: .url)
            multiple = try container.decodeCreativeWorksOrURLsifPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(creativeWork, forKey: .creativeWork)
            try container.encodeIfPresent(url, forKey: .url)
            try container.encodeIfPresent(multiple, forKey: .multiple)
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
    
    func testSingleDecodes() throws {
        let json = """
        {
            "creativeWork" : {
                "@type" : "CreativeWork",
                "name" : "Futurama"
            },
            "url" : "https://www.yahoo.com"
        }
        """
        
        let testable = try TestClass.make(with: json)
        
        guard
            let creativeWork = testable.creativeWork as? SOCreativeWorkOrURL,
            let url = testable.url as? SOCreativeWorkOrURL
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(url.url?.host, "www.yahoo.com")
    }
    
    func testSingleEncodes() throws {
        let testable = TestClass()
        
        let creativeWork = SOCreativeWork()
        creativeWork.name = "Futurama"
        testable.creativeWork = creativeWork
        
        testable.url = URL(string: "https://www.yahoo.com")
        
        let dictionary = try testable.dictionary()
        
        guard
            let cw = dictionary["creativeWork"] as? [String : Any],
            let path = dictionary["url"] as? String, let yahoo = URL(string: path)
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(cw["name"] as? String, "Futurama")
        XCTAssertEqual(yahoo.host, "www.yahoo.com")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "CreativeWork",
                    "name" : "Futurama"
                },
                "https://www.yahoo.com"
            ]
        }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable = try JSONDecoder().decode(TestClass.self, from: data)
        
        guard let multiple = testable.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        guard
            let creativeWork = multiple[0] as? SOCreativeWorkOrURL,
            let url = multiple[1] as? SOCreativeWorkOrURL
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(url.url?.host, "www.yahoo.com")
    }
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        let creativeWork = SOCreativeWork()
        let url = URL(string: "www.yahoo.com")!
        testable.multiple = [SOCreativeWorkOrURL.creativeWork(value: creativeWork), SOCreativeWorkOrURL.url(value: url)]
        
        let json = try testable.json()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}



