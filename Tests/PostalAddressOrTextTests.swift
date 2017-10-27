import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class PostalAddressOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var postalAddress: PostalAddressOrText?
        var text: PostalAddressOrText?
        
        private enum CodingKeys: String, CodingKey {
            case postalAddress
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.postalAddress = try container.decodePostalAddressOrTextIfPresent(forKey: .postalAddress)
            self.text = try container.decodePostalAddressOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.postalAddress, forKey: .postalAddress)
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
                "postalAddress" : {
                    "@type" : "PostalAddress",
                    "name" : "Infinite Loop"
                },
                "text" : "Apple Campus"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let postalAddress = testObject.postalAddress as? PostalAddress else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(postalAddress.name, "Infinite Loop")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Apple Campus")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let postalAddress = SOPostalAddress()
        postalAddress.name = "The Googleplex"
        testObject.postalAddress = postalAddress
        
        testObject.text = "Google Campus"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let pa = dictionary["postalAddress"] as? [String : Any], let paName = pa["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paName, "The Googleplex")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "Google Campus")
    }
}
