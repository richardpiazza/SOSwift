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
    
}
