import XCTest
@testable import SOSwift

class DataDownloadTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
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
        
        let dataDownload = try DataDownload.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try DataDownloadTests.dataDownload.asDictionary()
        
    }
    
}
