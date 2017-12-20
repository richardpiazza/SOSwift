import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class CreativeWorkOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrText?
        var text: CreativeWorkOrText?
        
        private enum CodingKeys: String, CodingKey {
            case creativeWork
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.creativeWork = try container.decodeCreativeWorkOrTextIfPresent(forKey: .creativeWork)
            self.text = try container.decodeCreativeWorkOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.creativeWork, forKey: .creativeWork)
            try container.encodeIfPresent(self.text, forKey: .text)
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
                "creativeWork" : {
                    "@type" : "CreativeWork",
                    "name" : "Futurama"
                },
                "text" : "Turtle"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let creativeWork = testObject.creativeWork as? CreativeWork else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(creativeWork.name, "Futurama")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Turtle")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let creativeWork = SOCreativeWork()
        creativeWork.name = "Futurama"
        testObject.creativeWork = creativeWork
        
        testObject.text = "Turtle"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let cw = dictionary["creativeWork"] as? [String : Any], let futurama = cw["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(futurama, "Futurama")
        
        guard let turtle = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(turtle, "Turtle")
    }
}


