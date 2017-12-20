import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class CreativeWorkOrProductOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrProductOrURL?
        var product: CreativeWorkOrProductOrURL?
        var url: CreativeWorkOrProductOrURL?
        
        private enum CodingKeys: String, CodingKey {
            case creativeWork
            case product
            case url
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.creativeWork = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .creativeWork)
            self.product = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .product)
            self.url = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .url)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.creativeWork, forKey: .creativeWork)
            try container.encodeIfPresent(self.product, forKey: .product)
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
                "product" : {
                    "@type" : "Product",
                    "name" : "Beans"
                },
                "url" : "https://www.google.com"
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
        
        guard let product = testObject.product as? Product else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(product.name, "Beans")
        
        guard let url = testObject.url as? URL else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.google.com")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let creativeWork = SOCreativeWork()
        creativeWork.name = "Futurama"
        testObject.creativeWork = creativeWork
        
        let product = SOProduct()
        product.name = "Beans"
        testObject.product = product
        
        testObject.url = URL(string: "https://www.google.com")
        
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
        
        guard let p = dictionary["product"] as? [String : Any], let beans = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(beans, "Beans")
        
        guard let path = dictionary["url"] as? String, let url = URL(string: path) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(url.host, "www.google.com")
    }
}

