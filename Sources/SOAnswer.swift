import Foundation
import SOSwiftVocabulary

public class SOAnswer: SOComment, Answer {
    override public class var type: String {
        return "Answer"
    }
}
