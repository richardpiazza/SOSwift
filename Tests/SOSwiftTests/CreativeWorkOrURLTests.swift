@testable import SOSwift
import XCTest

class CreativeWorkOrURLTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var creativeWork: CreativeWorkOrURL?
        var url: CreativeWorkOrURL?
        var multiple: [CreativeWorkOrURL]?
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

        guard let creativeWork = testable.creativeWork, let url = testable.url else {
            XCTFail()
            return
        }

        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(url.url?.host, "www.yahoo.com")
    }

    func testSingleEncodes() throws {
        let testable = TestClass()

        let creativeWork = CreativeWork()
        creativeWork.name = "Futurama"
        testable.creativeWork = .creativeWork(value: creativeWork)
        testable.url = .url(value: URL(string: "https://www.yahoo.com")!)

        let dictionary = try testable.asDictionary()

        guard
            let cw = dictionary["creativeWork"] as? [String: Any],
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

        let creativeWork = multiple[0]
        let url = multiple[1]

        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(url.url?.host, "www.yahoo.com")
    }

    func testMultipleEncodes() throws {
        let testable = TestClass()
        let creativeWork = CreativeWork()
        let url = URL(string: "www.yahoo.com")!
        testable.multiple = [CreativeWorkOrURL.creativeWork(value: creativeWork), CreativeWorkOrURL.url(value: url)]

        let json = try testable.asJSON()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
