import XCTest
@testable import SOSwift

class CommentTests: XCTestCase {
    
    public static var comment: Comment {
        let comment = Comment()
        
        return comment
    }
    
    func testSchema() throws {
        XCTAssertEqual(Comment.schemaName, "Comment")
    }
    
    func testDecode() throws {
        let json = """
        {
            
        }
        """
        
        _ = try Comment.make(with: json)
    }
    
    func testEncode() throws {
        _ = try CommentTests.comment.asDictionary()
    }
    
}
