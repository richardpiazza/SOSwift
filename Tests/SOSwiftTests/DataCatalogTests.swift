import XCTest
@testable import SOSwift

class DataCatalogTests: XCTestCase {
    
    public static var dataCatalog: DataCatalog {
        let dataCatalog = DataCatalog()
        
        return dataCatalog
    }
    
    func testSchema() throws {
        XCTAssertEqual(DataCatalog.schemaName, "DataCatalog")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        _ = try DataCatalog.make(with: json)
    }
    
    func testEncode() throws {
        _ = try DataCatalogTests.dataCatalog.asDictionary()
    }
    
}
