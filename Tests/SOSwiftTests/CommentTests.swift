import XCTest
@testable import SOSwift

class CommentTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static var comment: Comment {
        let comment = Comment()
        
        return comment
    }
    
    func testSchema() throws {
        XCTAssertEqual(Comment.schemaType, "Comment")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        let comment = try Comment.make(with: json)
        
    }
    
    func testEncode() throws {
        let dictionary = try CommentTests.comment.asDictionary()
        
    }
    
}
