import Foundation
import SOSwiftVocabulary

/// A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.
public class SOQuestion: SOCreativeWork, Question {
    
    public override class var type: String {
        return "Question"
    }
    
    /// The answer that has been accepted as best, typically on a Question/Answer site. Sites vary in their selection mechanisms, e.g. drawing on community opinion and/or the view of the Question author.
    public var acceptedAnswer: Answer?
    /// The number of answers this question has received.
    public var answerCount: Int?
    /// The number of downvotes this question, answer or comment has received from the community.
    public var downvoteCount: Int?
    /// An answer (possibly one of several, possibly incorrect) to a Question, e.g. on a Question/Answer site.
    public var suggestedAnswer: Answer?
    /// The number of upvotes this question, answer or comment has received from the community.
    public var upvoteCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case acceptedAnswer
        case answerCount
        case downvoteCount
        case suggestedAnswer
        case upvoteCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.acceptedAnswer = try container.decodeIfPresent(SOAnswer.self, forKey: .acceptedAnswer)
        self.answerCount = try container.decodeIfPresent(Int.self, forKey: .answerCount)
        self.downvoteCount = try container.decodeIfPresent(Int.self, forKey: .downvoteCount)
        self.suggestedAnswer = try container.decodeIfPresent(SOAnswer.self, forKey: .suggestedAnswer)
        self.upvoteCount = try container.decodeIfPresent(Int.self, forKey: .upvoteCount)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.acceptedAnswer, forKey: .acceptedAnswer)
        try container.encodeIfPresent(self.answerCount, forKey: .answerCount)
        try container.encodeIfPresent(self.downvoteCount, forKey: .downvoteCount)
        try container.encodeIfPresent(self.suggestedAnswer, forKey: .suggestedAnswer)
        try container.encodeIfPresent(self.upvoteCount, forKey: .upvoteCount)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Question?, forKey key: K) throws {
        if let typedValue = value as? SOQuestion {
            try self.encode(typedValue, forKey: key)
        }
    }
}
