import Foundation
import SOSwiftVocabulary

/// A comment on an item - for example, a comment on a blog post.
/// The comment's content is expressed via the text property, and its topic via about, properties shared with all CreativeWorks.
public class SOComment: SOCreativeWork, Comment {
    public struct Keys {
        public static let downvoteCount = "downvoteCount"
        public static let parentItem = "parentItem"
        public static let upvoteCount = "upvoteCount"
    }
    
    override public class var type: String {
        return "Comment"
    }
    
    /// The number of downvotes this question, answer or comment has received from the community.
    public var downvoteCount: Int?
    /// The parent of a question, answer or item in general.
    public var parentItem: Question?
    /// The number of upvotes this question, answer or comment has received from the community.
    public var upvoteCount: Int?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.downvoteCount] as? Int {
            self.downvoteCount = value
        }
        if let value = dictionary[Keys.parentItem] as? [String : AnyObject] {
            self.parentItem = SOQuestion(dictionary: value)
        }
        if let value = dictionary[Keys.upvoteCount] as? Int {
            self.upvoteCount = value
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.downvoteCount {
            dictionary[Keys.downvoteCount] = value as AnyObject
        }
        if let value = self.parentItem as? SOQuestion {
            dictionary[Keys.parentItem] = value.dictionary as AnyObject
        }
        if let value = self.upvoteCount {
            dictionary[Keys.upvoteCount] = value as AnyObject
        }
        return dictionary
    }
}
