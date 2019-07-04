import XCTest
@testable import SOSwift

class CourseInstanceTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static var courseInstance: CourseInstance {
        let courseInstance = CourseInstance()
        
        return courseInstance
    }
    
    func testSchema() throws {
        XCTAssertEqual(CourseInstance.schemaType, "CourseInstance")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        let courseInstance = try CourseInstance.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try CourseInstanceTests.courseInstance.asDictionary()
        
    }
    
}
