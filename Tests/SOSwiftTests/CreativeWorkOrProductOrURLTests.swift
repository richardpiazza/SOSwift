import XCTest
@testable import SOSwift

class CreativeWorkOrProductOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrProductOrURL?
        var product: CreativeWorkOrProductOrURL?
        var url: CreativeWorkOrProductOrURL?
        var multiple: [CreativeWorkOrProductOrURL]?
        
        private enum CodingKeys: String, CodingKey {
            case creativeWork
            case product
            case url
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            creativeWork = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .creativeWork)
            product = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .product)
            url = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .url)
            multiple = try container.decodeCreativeWorksOrProductsOrURLsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(creativeWork, forKey: .creativeWork)
            try container.encodeIfPresent(product, forKey: .product)
            try container.encodeIfPresent(url, forKey: .url)
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
            "product" : {
                "@type" : "Product",
                "name" : "Beans"
            },
            "url" : "https://www.google.com"
        }
        """
        
        let testable = try TestClass.make(with: json)
        
        guard
            let creativeWork = testable.creativeWork as? SOCreativeWorkOrProductOrURL,
            let product = testable.product as? SOCreativeWorkOrProductOrURL,
            let url = testable.url as? SOCreativeWorkOrProductOrURL
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(product.product?.name, "Beans")
        XCTAssertEqual(url.url?.host, "www.google.com")
    }
    
    func testSingleEncodes() throws {
        let testable = TestClass()
        
        let creativeWork = SOCreativeWork()
        creativeWork.name = "Futurama"
        testable.creativeWork = creativeWork
        
        let product = SOProduct()
        product.name = "Beans"
        testable.product = product
        
        testable.url = URL(string: "https://www.google.com")
        
        let dictionary = try testable.dictionary()
        
        guard
            let cw = dictionary["creativeWork"] as? [String : Any],
            let p = dictionary["product"] as? [String : Any],
            let path = dictionary["url"] as? String, let url = URL(string: path)
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(cw["name"] as? String, "Futurama")
        XCTAssertEqual(p["name"] as? String, "Beans")
        XCTAssertEqual(url.host, "www.google.com")
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "CreativeWork",
                    "name" : "Futurama"
                },
                {
                    "@type" : "Product",
                    "name" : "Beans"
                },
                "https://www.google.com"
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
        
        XCTAssertEqual(multiple.count, 3)
        
        guard
            let creativeWork = multiple[0] as? SOCreativeWorkOrProductOrURL,
            let product = multiple[1] as? SOCreativeWorkOrProductOrURL,
            let url = multiple[2] as? SOCreativeWorkOrProductOrURL
            else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(creativeWork.creativeWork?.name, "Futurama")
        XCTAssertEqual(product.product?.name, "Beans")
        XCTAssertEqual(url.url?.host, "www.google.com")
    }
    
    func testMultipeEncodes() throws {
        let testable = TestClass()
        let creativeWork = SOCreativeWork()
        let product = SOProduct()
        let url = URL(string: "www.google.com")!
        testable.multiple = [SOCreativeWorkOrProductOrURL.creativeWork(value: creativeWork), SOCreativeWorkOrProductOrURL.product(value: product), SOCreativeWorkOrProductOrURL.url(value: url)]
        
        let json = try testable.json()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}

