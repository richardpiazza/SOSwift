import Foundation

/// AlignmentObject, Course, Text
public protocol AlignmentObjectOrCourseOrText {}

public extension AlignmentObjectOrCourseOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? AlignmentObject {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Course {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: AlignmentObjectOrCourseOrText {}
