import XCTest
@testable import SOSwift

class BroadcastServiceTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static let _audienceType = "Programmers"
    public static let _geographicArea = "5ft of a computer"
    
    public static var broadcastService: BroadcastService {
        let broadcastService = BroadcastService()
        
        return broadcastService
    }
    
    func testSchema() throws {
        XCTAssertEqual(BroadcastService.schemaType, "BroadcastService")
    }
    
    func testDecode() throws {
        let json = """
        {
            "broadcastDisplayName": "All",
            "geographicArea": {
                "name": "Here"
            }
        }
        """
        
        let broadcastService = try BroadcastService.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try BroadcastServiceTests.broadcastService.asDictionary()
        
    }
    
}
