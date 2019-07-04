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
    
    internal enum QuestionCodingKeys: String, CodingKey {
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
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: QuestionCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: QuestionCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}