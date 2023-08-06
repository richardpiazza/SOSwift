import XCTest
@testable import SOSwift

class CourseInstanceTests: XCTestCase {
    
    public static var courseInstance: CourseInstance {
        let courseInstance = CourseInstance()
        
        return courseInstance
    }
    
    func testSchema() throws {
        XCTAssertEqual(CourseInstance.schemaName, "CourseInstance")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        _ = try CourseInstance.make(with: json)
    }
    
    func testEncode() throws {
        _ = try CourseInstanceTests.courseInstance.asDictionary()
    }
    
}
