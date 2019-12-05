import XCTest
@testable import SOSwift

class CreativeWorkOrEventTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var creativeWork: CreativeWorkOrEvent?
        var event: CreativeWorkOrEvent?
        var multiple: [CreativeWorkOrEvent]?
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSingleDecode() throws {
        let json = """
        {
            "creativeWork": {
                "@type": "CreativeWork",
                "name": "Technical Manual"
            },
            "event": {
                "@type": "Event",
                "name": "Convention"
            }
        }
        """
        
        let testable = try TestClass.make(with: json)
        
        guard let creativeWork = testable.creativeWork, let event = testable.event else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Technical Manual")
        XCTAssertEqual(event.event?.name, "Convention")
    }
    
    func testSingleEncode() throws {
        let testable = TestClass()
        
        let creativeWork = CreativeWork()
        creativeWork.name = "Technical Manual"
        
        let event = Event()
        event.name = "Convention"
        
        testable.creativeWork = CreativeWorkOrEvent.creativeWork(value: creativeWork)
        testable.event = CreativeWorkOrEvent.event(value: event)
        
        let dictionary = try testable.asDictionary()
        
        guard
            let cw = dictionary["creativeWork"] as? [String : Any],
            let e = dictionary["event"] as? [String : Any]
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(cw["name"] as? String, "Technical Manual")
        XCTAssertEqual(e["name"] as? String, "Convention")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type": "CreativeWork",
                    "name": "Technical Manual"
                },
                {
                    "@type": "Event",
                    "name": "Convention"
                }
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
        let event = multiple[1]
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Technical Manual")
        XCTAssertEqual(event.event?.name, "Convention")
    }
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        let creativeWork = CreativeWork()
        let event = Event()
        testable.multiple = [CreativeWorkOrEvent.creativeWork(value: creativeWork), CreativeWorkOrEvent.event(value: event)]
        
        let json = try testable.asJSON()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
