import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class CreativeWorkOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrText?
        var text: CreativeWorkOrText?
        var multiple: [CreativeWorkOrText]?
        
        private enum CodingKeys: String, CodingKey {
            case creativeWork
            case text
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            creativeWork = try container.decodeCreativeWorkOrTextIfPresent(forKey: .creativeWork)
            text = try container.decodeCreativeWorkOrTextIfPresent(forKey: .text)
            multiple = try container.decodeCreativeWorksOrTextsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(creativeWork, forKey: .creativeWork)
            try container.encodeIfPresent(text, forKey: .text)
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
            "text" : "Turtle"
        }
        """
        
        let testable = try TestClass.make(with: json)
        
        guard
            let creativeWork = testable.creativeWork as? SOCreativeWorkOrText,
            let text = testable.text as? SOCreativeWorkOrText
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(text.text, "Turtle")
    }
    
    func testSingleEncodes() throws {
        let testable = TestClass()
        
        let creativeWork = SOCreativeWork()
        creativeWork.name = "Futurama"
        testable.creativeWork = creativeWork
        
        testable.text = "Turtle"
        
        let dictionary = try testable.dictionary()
        
        guard
            let cw = dictionary["creativeWork"] as? [String : Any],
            let turtle = dictionary["text"] as? String
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(cw["name"] as? String, "Futurama")
        XCTAssertEqual(turtle, "Turtle")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "CreativeWork",
                    "name" : "Futurama"
                },
                "Turtle"
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
            let creativeWork = multiple[0] as? SOCreativeWorkOrText,
            let text = multiple[1] as? SOCreativeWorkOrText
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(text.text, "Turtle")
    }
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        let creativeWork = SOCreativeWork()
        let text = "Turtle"
        testable.multiple = [SOCreativeWorkOrText.creativeWork(value: creativeWork), SOCreativeWorkOrText.text(value: text)]
        
        let json = try testable.json()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}


