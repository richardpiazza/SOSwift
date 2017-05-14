import Foundation

/// A comment on an item - for example, a comment on a blog post. The comment's content is expressed via the text property, and its topic via about, properties shared with all CreativeWorks.
public protocol Comment: CreativeWork {
    /// The number of downvotes this question, answer or comment has received from the community.
    var downvoteCount: Int? { get set }
    /// The parent of a question, answer or item in general.
    var parentItem: Question? { get set }
    /// The number of upvotes this question, answer or comment has received from the community.
    var upvoteCount: Int? { get set }
}
