import Foundation
import SOSwiftVocabulary

/// A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.
public class SOQuestion: SOCreativeWork, Question {
    public struct Keys {
        public static let acceptedAnswer = "acceptedAnswer"
        public static let answerCount = "answerCount"
        public static let downvoteCount = "downvoteCount"
        public static let suggestedAnswer = "suggestedAnswer"
        public static let upvoteCount = "upvoteCount"
    }
    
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.acceptedAnswer] as? [String : AnyObject] {
            self.acceptedAnswer = SOAnswer(dictionary: value)
        }
        if let value = dictionary[Keys.answerCount] as? Int {
            self.answerCount = value
        }
        if let value = dictionary[Keys.downvoteCount] as? Int {
            self.downvoteCount = value
        }
        if let value = dictionary[Keys.suggestedAnswer] as? [String : AnyObject] {
            self.suggestedAnswer = SOAnswer(dictionary: value)
        }
        if let value = dictionary[Keys.upvoteCount] as? Int {
            self.upvoteCount = value
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.acceptedAnswer as? SOAnswer {
            dictionary[Keys.acceptedAnswer] = value.dictionary as AnyObject
        }
        if let value = self.answerCount {
            dictionary[Keys.answerCount] = value as AnyObject
        }
        if let value = self.downvoteCount {
            dictionary[Keys.downvoteCount] = value as AnyObject
        }
        if let value = self.suggestedAnswer as? SOAnswer {
            dictionary[Keys.suggestedAnswer] = value.dictionary as AnyObject
        }
        if let value = self.upvoteCount {
            dictionary[Keys.upvoteCount] = value as AnyObject
        }
        return dictionary
    }
}
