import Foundation
import SOSwiftVocabulary

public extension AlignmentObjectOrCourseOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOAlignmentObject {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOCourse {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
