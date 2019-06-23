import XCTest
@testable import SOSwift

class PlaceOrPostalAddressOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var place: PlaceOrPostalAddressOrText?
        var postalAddress: PlaceOrPostalAddressOrText?
        var text: PlaceOrPostalAddressOrText?
        
        private enum CodingKeys: String, CodingKey {
            case place
            case postalAddress
            case text
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.place = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .place)
            self.postalAddress = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .postalAddress)
            self.text = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .text)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.place, forKey: .place)
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
                "place" : {
                    "@type" : "Place",
                    "name" : "Apple Campus"
                },
                "postalAddress" : {
                    "@type" : "PostalAddress",
                    "name" : "Infinite Loop"
                },
                "text" : "Pre-Spaceship"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let place = testObject.place as? Place else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(place.name, "Apple Campus")
        
        guard let postalAddress = testObject.postalAddress as? PostalAddress else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(postalAddress.name, "Infinite Loop")
        
        guard let text = testObject.text as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(text, "Pre-Spaceship")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let place = SOPlace()
        place.name = "Google Campus"
        testObject.place = place
        
        let postalAddress = SOPostalAddress()
        postalAddress.name = "Mountain View"
        testObject.postalAddress = postalAddress
        
        testObject.text = "The Googleplex"
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let p = dictionary["place"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Google Campus")
        
        guard let pa = dictionary["postalAddress"] as? [String : Any], let paName = pa["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paName, "Mountain View")
        
        guard let t = dictionary["text"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t, "The Googleplex")
    }
    
    func testMultipleDecodes() throws {
        
    }
    
    func testMultipleEncodes() throws {
        
    }
}
