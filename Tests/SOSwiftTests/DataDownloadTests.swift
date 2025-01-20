@testable import SOSwift
import XCTest

class DataDownloadTests: XCTestCase {

    public static var dataDownload: DataDownload {
        let dataDownload = DataDownload()

        return dataDownload
    }

    func testSchema() throws {
        XCTAssertEqual(DataDownload.schemaName, "DataDownload")
    }

    func testDecode() throws {
        let json = """
        {

        }
        """

        _ = try DataDownload.make(with: json)
    }

    func testEncode() throws {
        _ = try DataDownloadTests.dataDownload.asDictionary()
    }
}
