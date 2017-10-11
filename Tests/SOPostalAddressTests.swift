import XCTest
@testable import SOSwift

class SOPostalAddressTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /// Test `SOPostalAddress`
    func testSOPostalAddress() {
        var json = "{"
        json.append("\"@type\": \"PostalAddress\",")
        json.append("\"name\": \"MetroBeat Fitness & Dance\",")
        json.append("\"streetAddress\": \"3735 Douglas Dr. N.\",")
        json.append("\"addressLocality\": \"Crystal\",")
        json.append("\"addressRegion\": \"MN\",")
        json.append("\"postalCode\": \"55422\",")
        json.append("\"addressCountry\": \"United States\"")
        json.append("}")
        
        let postalAddress = SOPostalAddress(json: json)
        
        XCTAssertEqual(postalAddress.name, "MetroBeat Fitness & Dance")
        XCTAssertEqual(postalAddress.street, "3735 Douglas Dr. N.")
        XCTAssertEqual(postalAddress.city, "Crystal")
        XCTAssertEqual(postalAddress.state, "MN")
        XCTAssertEqual(postalAddress.zip, "55422")
        XCTAssertEqual(postalAddress.addressCountry as? String, "United States")
    }
}
