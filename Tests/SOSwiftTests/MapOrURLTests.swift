import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class MapOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var map: MapOrURL?
        var url: MapOrURL?
        
        private enum CodingKeys: String, CodingKey {
            case map
            case url
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.map = try container.decodeMapOrURLIfPresent(forKey: .map)
            self.url = try container.decodeMapOrURLIfPresent(forKey: .url)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.map, forKey: .map)
            try container.encodeIfPresent(self.url, forKey: .url)
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
                "map" : {
                    "@type" : "Map",
                    "name" : "World Map"
                },
                "url" : "https://en.wikipedia.org/wiki/World_map"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let map = testObject.map as? Map else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(map.name, "World Map")
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "en.wikipedia.org")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let map = SOMap()
        map.name = "United States Map"
        testObject.map = map
        
        testObject.url = URL(string: "https://commons.wikimedia.org/wiki/Category:Maps_of_the_United_States")
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let m = dictionary["map"] as? [String : Any], let mName = m["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(mName, "United States Map")
        
        guard let u = dictionary["url"] as? String, let url = URL(string: u) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "commons.wikimedia.org")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}

