import XCTest
@testable import SOSwift

class DataFeedItemTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static var dataFeedItem: DataFeedItem {
        let dataFeedItem = DataFeedItem()
        
        return dataFeedItem
    }
    
    func testSchema() throws {
        XCTAssertEqual(DataFeedItem.schemaName, "DataFeedItem")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        let dataFeedItem = try DataFeedItem.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try DataFeedItemTests.dataFeedItem.asDictionary()
        
    }
    
}
