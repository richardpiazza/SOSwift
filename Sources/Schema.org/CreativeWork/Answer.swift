import Foundation

/// An answer offered to a question; perhaps correct, perhaps opinionated or wrong.
public protocol Answer: Comment {
    /// The number of downvotes this question, answer or comment has received from the community.
    var downvoteCount: Int? { get set }
    /// The parent of a question, answer or item in general.
    var parentItem: Question? { get set }
    /// The number of upvotes this question, answer or comment has received from the community.
    var upvoteCount: Int? { get set }
}
