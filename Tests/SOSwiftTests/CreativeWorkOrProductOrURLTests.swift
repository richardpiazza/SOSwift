import XCTest
@testable import SOSwift

class CreativeWorkOrProductOrURLTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var creativeWork: CreativeWorkOrProductOrURL?
        var product: CreativeWorkOrProductOrURL?
        var url: CreativeWorkOrProductOrURL?
        var multiple: [CreativeWorkOrProductOrURL]?
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
            let creativeWork = testable.creativeWork as? CreativeWorkOrProductOrURL,
            let product = testable.product as? CreativeWorkOrProductOrURL,
            let url = testable.url as? CreativeWorkOrProductOrURL
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
        
        let creativeWork = CreativeWork()
        creativeWork.name = "Futurama"
        testable.creativeWork = .creativeWork(value: creativeWork)
        
        let product = Product()
        product.name = "Beans"
        testable.product = .product(value: product)
        testable.url = .url(value: URL(string: "https://www.google.com")!)
        
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
            let creativeWork = multiple[0] as? CreativeWorkOrProductOrURL,
            let product = multiple[1] as? CreativeWorkOrProductOrURL,
            let url = multiple[2] as? CreativeWorkOrProductOrURL
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
        let creativeWork = CreativeWork()
        let product = Product()
        let url = URL(string: "www.google.com")!
        testable.multiple = [CreativeWorkOrProductOrURL.creativeWork(value: creativeWork), CreativeWorkOrProductOrURL.product(value: product), CreativeWorkOrProductOrURL.url(value: url)]
        
        let json = try testable.json()
        XCTAssertTrue(json.contains("\"multiple\":["))
    }
}

