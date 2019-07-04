import XCTest
@testable import SOSwift

class DataFeedTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static var dataFeed: DataFeed {
        let dataFeed = DataFeed()
        
        return dataFeed
    }
    
    func testSchema() throws {
        XCTAssertEqual(DataFeed.schemaType, "DataFeed")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        let dataFeed = try DataFeed.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try DataFeedTests.dataFeed.asDictionary()
        
    }
    
}
