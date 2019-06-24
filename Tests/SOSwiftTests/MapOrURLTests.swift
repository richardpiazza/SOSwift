import XCTest
@testable import SOSwift

class MapOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var map: MapOrURL?
        var url: MapOrURL?
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
        
        let map = Map()
        map.name = "United States Map"
        testObject.map = .map(value: map)
        
        testObject.url = .url(value: URL(string: "https://commons.wikimedia.org/wiki/Category:Maps_of_the_United_States")!)
        
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

