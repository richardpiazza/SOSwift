import Foundation
import SOSwiftVocabulary

/// A comment on an item - for example, a comment on a blog post.
/// The comment's content is expressed via the text property, and its topic via about, properties shared with all CreativeWorks.
public class SOComment: SOCreativeWork, Comment {

    override public class var type: String {
        return "Comment"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(Int.self, forKey: .downvoteCount) {
            self.downvoteCount = value
        }
        if let value = try container.decodeIfPresent(SOQuestion.self, forKey: .parentItem) {
            self.parentItem = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .upvoteCount) {
            self.upvoteCount = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.downvoteCount {
            try container.encode(value, forKey: .downvoteCount)
        }
        if let value = self.parentItem as? SOQuestion {
            try container.encode(value, forKey: .parentItem)
        }
        if let value = self.upvoteCount {
            try container.encode(value, forKey: .upvoteCount)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}