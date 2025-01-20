@testable import SOSwift
import XCTest

class BroadcastServiceTests: XCTestCase {

    public static let _audienceType = "Programmers"
    public static let _geographicArea = "5ft of a computer"

    public static var broadcastService: BroadcastService {
        let broadcastService = BroadcastService()

        return broadcastService
    }

    func testSchema() throws {
        XCTAssertEqual(BroadcastService.schemaName, "BroadcastService")
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

        _ = try BroadcastService.make(with: json)
    }

    func testEncode() throws {
        _ = try BroadcastServiceTests.broadcastService.asDictionary()
    }
}
