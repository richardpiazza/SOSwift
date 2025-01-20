@testable import SOSwift
import XCTest

class DataFeedItemTests: XCTestCase {

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

        _ = try DataFeedItem.make(with: json)
    }

    func testEncode() throws {
        _ = try DataFeedItemTests.dataFeedItem.asDictionary()
    }
}
