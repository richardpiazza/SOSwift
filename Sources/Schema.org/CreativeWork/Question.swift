import Foundation

/// A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.
public protocol Question: CreativeWork {
    /// The answer that has been accepted as best, typically on a Question/Answer site. Sites vary in their selection mechanisms, e.g. drawing on community opinion and/or the view of the Question author.
    var acceptedAnswer: Answer? { get set }
    /// The number of answers this question has received.
    var answerCount: Int? { get set }
    /// The number of downvotes this question, answer or comment has received from the community.
    var downvoteCountn: Int? { get set }
    /// An answer (possibly one of several, possibly incorrect) to a Question, e.g. on a Question/Answer site.
    var suggestedAnswer: Answer? { get set }
    /// The number of upvotes this question, answer or comment has received from the community.
    var upvoteCount: Int? { get set }
}
