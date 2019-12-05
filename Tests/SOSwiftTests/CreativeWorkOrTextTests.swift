import XCTest
@testable import SOSwift

class CreativeWorkOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var creativeWork: CreativeWorkOrText?
        var text: CreativeWorkOrText?
        var multiple: [CreativeWorkOrText]?
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
        
        guard let creativeWork = testable.creativeWork, let text = testable.text else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(text.text, "Turtle")
    }
    
    func testSingleEncodes() throws {
        let testable = TestClass()
        
        let creativeWork = CreativeWork()
        creativeWork.name = "Futurama"
        testable.creativeWork = .creativeWork(value: creativeWork)
        testable.text = .text(value: "Turtle")
        
        let dictionary = try testable.asDictionary()
        
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
        
        let creativeWork = multiple[0]
        let text = multiple[1]
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(text.text, "Turtle")
    }
    
    func testMultipleEncodes() throws {
        let testable = TestClass()
        let creativeWork = CreativeWork()
        let text = "Turtle"
        testable.multiple = [CreativeWorkOrText.creativeWork(value: creativeWork), CreativeWorkOrText.text(value: text)]
        
        let json = try testable.asJSON()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}


