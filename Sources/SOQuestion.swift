import Foundation
import SOSwiftVocabulary

/// A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.
public class SOQuestion: SOCreativeWork, Question {
    
    override public class var type: String {
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOAnswer.self, forKey: .acceptedAnswer) {
            self.acceptedAnswer = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .answerCount) {
            self.answerCount = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .downvoteCount) {
            self.downvoteCount = value
        }
        if let value = try container.decodeIfPresent(SOAnswer.self, forKey: .suggestedAnswer) {
            self.suggestedAnswer = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .upvoteCount) {
            self.upvoteCount = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.acceptedAnswer as? SOAnswer {
            try container.encode(value, forKey: .acceptedAnswer)
        }
        if let value = self.answerCount {
            try container.encode(value, forKey: .answerCount)
        }
        if let value = self.downvoteCount {
            try container.encode(value, forKey: .downvoteCount)
        }
        if let value = self.suggestedAnswer as? SOAnswer {
            try container.encode(value, forKey: .suggestedAnswer)
        }
        if let value = self.upvoteCount {
            try container.encode(value, forKey: .upvoteCount)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
