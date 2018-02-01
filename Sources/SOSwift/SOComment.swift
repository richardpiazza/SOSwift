import Foundation
import SOSwiftVocabulary

/// A comment on an item - for example, a comment on a blog post.
/// The comment's content is expressed via the text property, and its topic via about, properties shared with all CreativeWorks.
public class SOComment: SOCreativeWork, Comment {

    public override class var type: String {
        return "Comment"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [SOAnswer.self]
    }
    
    /// The number of downvotes this question, answer or comment has received from the community.
    public var downvoteCount: Int?
    /// The parent of a question, answer or item in general.
    public var parentItem: Question?
    /// The number of upvotes this question, answer or comment has received from the community.
    public var upvoteCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case downvoteCount
        case parentItem
        case upvoteCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.downvoteCount = try container.decodeIfPresent(Int.self, forKey: .downvoteCount)
        self.parentItem = try container.decodeIfPresent(SOQuestion.self, forKey: .parentItem)
        self.upvoteCount = try container.decodeIfPresent(Int.self, forKey: .upvoteCount)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.downvoteCount, forKey: .downvoteCount)
        try container.encodeIfPresent(self.parentItem, forKey: .parentItem)
        try container.encodeIfPresent(self.upvoteCount, forKey: .upvoteCount)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Comment?, forKey key: K) throws {
        if let typedValue = value as? SOComment {
            try self.encode(typedValue, forKey: key)
        }
    }
}
