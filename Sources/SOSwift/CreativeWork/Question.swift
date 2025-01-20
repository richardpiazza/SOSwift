import Foundation

/// A specific question - e.g. from a user seeking answers online, or collected in
/// a Frequently Asked Questions (FAQ) document.
public class Question: CreativeWork {

    /// The answer that has been accepted as best, typically on a
    /// Question/Answer site. Sites vary in their selection mechanisms, e.g.
    /// drawing on community opinion and/or the view of the Question author.
    public var acceptedAnswer: Answer?

    /// The number of answers this question has received.
    public var answerCount: Int?

    /// The number of downvotes this question, answer or comment has received
    /// from the community.
    public var downvoteCount: Int?

    /// An answer (possibly one of several, possibly incorrect) to a Question, e.g.
    /// on a Question/Answer site.
    public var suggestedAnswer: Answer?

    /// The number of upvotes this question, answer or comment has received
    /// from the community.
    public var upvoteCount: Int?

    enum QuestionCodingKeys: String, CodingKey {
        case acceptedAnswer
        case answerCount
        case downvoteCount
        case suggestedAnswer
        case upvoteCount
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: QuestionCodingKeys.self)

        acceptedAnswer = try container.decodeIfPresent(Answer.self, forKey: .acceptedAnswer)
        answerCount = try container.decodeIfPresent(Int.self, forKey: .answerCount)
        downvoteCount = try container.decodeIfPresent(Int.self, forKey: .downvoteCount)
        suggestedAnswer = try container.decodeIfPresent(Answer.self, forKey: .suggestedAnswer)
        upvoteCount = try container.decodeIfPresent(Int.self, forKey: .upvoteCount)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: QuestionCodingKeys.self)

        try container.encodeIfPresent(acceptedAnswer, forKey: .acceptedAnswer)
        try container.encodeIfPresent(answerCount, forKey: .answerCount)
        try container.encodeIfPresent(downvoteCount, forKey: .downvoteCount)
        try container.encodeIfPresent(suggestedAnswer, forKey: .suggestedAnswer)
        try container.encodeIfPresent(upvoteCount, forKey: .upvoteCount)

        try super.encode(to: encoder)
    }
}
