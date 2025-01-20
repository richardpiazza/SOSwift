@testable import SOSwift
import XCTest

class MapOrURLTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var map: MapOrURL?
        var url: MapOrURL?
    }

    func testDecode() throws {
        let json = """
        {
            "map" : {
                "@type" : "Map",
                "name" : "World Map"
            },
            "url" : "https://en.wikipedia.org/wiki/World_map"
        }
        """

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.map?.map?.name, "World Map")
        XCTAssertEqual(testObject.url?.url?.host, "en.wikipedia.org")
    }

    func testEncode() throws {
        let testObject = TestClass()

        let map = Map()
        map.name = "United States Map"
        testObject.map = .map(value: map)

        testObject.url = .url(value: URL(string: "https://commons.wikimedia.org/wiki/Category:Maps_of_the_United_States")!)

        let dictionary = try testObject.asDictionary()

        guard let m = dictionary["map"] as? [String: Any], let mName = m["name"] as? String else {
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

    func testEquatability() throws {}
}
