import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class CreativeWorkOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrURL?
        var url: CreativeWorkOrURL?
        
        private enum CodingKeys: String, CodingKey {
            case creativeWork
            case url
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.creativeWork = try container.decodeCreativeWorkOrURLIfPresent(forKey: .creativeWork)
            self.url = try container.decodeCreativeWorkOrURLIfPresent(forKey: .url)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.creativeWork, forKey: .creativeWork)
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
                "creativeWork" : {
                    "@type" : "CreativeWork",
                    "name" : "Futurama"
                },
                "url" : "https://www.yahoo.com"
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
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.yahoo.com")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let creativeWork = SOCreativeWork()
        creativeWork.name = "Futurama"
        testObject.creativeWork = creativeWork
        
        testObject.url = URL(string: "https://www.yahoo.com")
        
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
        
        guard let path = dictionary["url"] as? String, let yahoo = URL(string: path) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(yahoo.host, "www.yahoo.com")
    }
}



