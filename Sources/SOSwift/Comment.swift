import Foundation

/// A comment on an item - for example, a comment on a blog post.
///
/// The comment's content is expressed via the text property, and its topic via about, properties shared with all
/// CreativeWorks.
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
        
        downvoteCount = try container.decodeIfPresent(Int.self, forKey: .downvoteCount)
        parentItem = try container.decodeIfPresent(Question.self, forKey: .parentItem)
        upvoteCount = try container.decodeIfPresent(Int.self, forKey: .upvoteCount)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CommentCodingKeys.self)
        
        try container.encodeIfPresent(downvoteCount, forKey: .downvoteCount)
        try container.encodeIfPresent(parentItem, forKey: .parentItem)
        try container.encodeIfPresent(upvoteCount, forKey: .upvoteCount)
        
        try super.encode(to: encoder)
    }
}
