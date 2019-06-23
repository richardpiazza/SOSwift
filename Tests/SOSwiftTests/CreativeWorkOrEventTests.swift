import XCTest
@testable import SOSwift

class CreativeWorkOrEventTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrEvent?
        var event: CreativeWorkOrEvent?
        var multiple: [CreativeWorkOrEvent]?
        
        private enum CodingKeys: String, CodingKey {
            case creativeWork
            case event
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            creativeWork = try container.decodeCreativeWorkOrEventIfPresent(forKey: .creativeWork)
            event = try container.decodeCreativeWorkOrEventIfPresent(forKey: .event)
            multiple = try container.decodeCreativeWorksOrEventsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(creativeWork, forKey: .creativeWork)
            try container.encodeIfPresent(event, forKey: .event)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
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
        
        guard
            let creativeWork = testable.creativeWork as? SOCreativeWorkOrEvent,
            let event = testable.event as? SOCreativeWorkOrEvent
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Technical Manual")
        XCTAssertEqual(event.event?.name, "Convention")
    }
    
    func testSingleEncode() throws {
        let testable = TestClass()
        
        let creativeWork = SOCreativeWork()
        creativeWork.name = "Technical Manual"
        
        let event = SOEvent()
        event.name = "Convention"
        
        testable.creativeWork = SOCreativeWorkOrEvent.creativeWork(value: creativeWork)
        testable.event = SOCreativeWorkOrEvent.event(value: event)
        
        let dictionary = try testable.dictionary()
        
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
        
        guard
            let creativeWork = multiple[0] as? SOCreativeWorkOrEvent,
            let event = multiple[1] as? SOCreativeWorkOrEvent
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Technical Manual")
        XCTAssertEqual(event.event?.name, "Convention")
    }
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        let creativeWork = SOCreativeWork()
        let event = SOEvent()
        testable.multiple = [SOCreativeWorkOrEvent.creativeWork(value: creativeWork), SOCreativeWorkOrEvent.event(value: event)]
        
        let json = try testable.json()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}
