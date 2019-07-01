import XCTest
@testable import SOSwift

class EventTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    func testSchema() throws {
        XCTAssertEqual(Event.schemaType, "Event")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        let _ = try Event.make(with: json)
    }
    
    func testEncode() throws {
        
        let event = Event()
        
        let _ = try event.asDictionary()
        
        
    }
}
