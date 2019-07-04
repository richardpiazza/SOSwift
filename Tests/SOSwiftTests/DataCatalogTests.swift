import XCTest
@testable import SOSwift

class DataCatalogTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static var dataCatalog: DataCatalog {
        let dataCatalog = DataCatalog()
        
        return dataCatalog
    }
    
    func testSchema() throws {
        XCTAssertEqual(DataCatalog.schemaType, "DataCatalog")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        let dataCatalog = try DataCatalog.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try DataCatalogTests.dataCatalog.asDictionary()
        
    }
    
}
