import Foundation

/// A comment on an item - for example, a comment on a blog post.
///
/// The comment's content is expressed via the text property, and its topic
/// via about, properties shared with all CreativeWorks.
public class Comment: CreativeWork {
    
    /// The number of downvotes this question, answer or comment has received from the community.
    public var downvoteCount: Int?
    
    /// The parent of a question, answer or item in general.
    public var parentItem: Question?
    
    /// The number of upvotes this question, answer or comment has received from the community.
    public var upvoteCount: Int?
    
    internal enum CommentCodingKeys: String, CodingKey {
        case downvoteCount
        case parentItem
        case upvoteCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CommentCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CommentCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
