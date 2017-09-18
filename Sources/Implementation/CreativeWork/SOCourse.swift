import Foundation

/// A description of an educational course which may be offered as distinct instances at which take place at different times or take place at different locations, or be offered through different media or modes of study.
/// An educational course is a sequence of one or more educational events and/or creative works which aims to build knowledge, competence or ability of learners.
public class SOCourse: SOCreativeWork, Course {
    public struct Keys {
        public static let courseCode = "courseCode"
        public static let coursePrerequisites = "coursePrerequisites"
        public static let hasCourseInstance = "hasCourseInstance"
    }
    
    override public class var type: String {
        return "Course"
    }
    
    /// The identifier for the Course used by the course provider (e.g. CS101 or 6.001).
    public var courseCode: String?
    /// Requirements for taking the Course. May be completion of another Course or a textual description like "permission of instructor". Requirements may be a pre-requisite competency, referenced using AlignmentObject.
    public var coursePrerequisites: [AlignmentObjectOrCourseOrText]?
    /// An offering of the course at a specific time and place or through specific media or mode of study or to a specific section of students.
    public var hasCourseInstance: CourseInstance?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.courseCode] as? String {
            self.courseCode = value
        }
        if let value = dictionary[Keys.coursePrerequisites] {
            self.coursePrerequisites = []
            if let typedValue = value as? [[String : AnyObject]] {
                for element in typedValue {
                    if let item = makeAlignmentObjectOrCourseOrText(anyObject: element as AnyObject) {
                        self.coursePrerequisites?.append(item)
                    }
                }
            } else {
                if let item = makeAlignmentObjectOrCourseOrText(anyObject: value) {
                    self.coursePrerequisites?.append(item)
                }
            }
        }
        if let value = dictionary[Keys.hasCourseInstance] as? [String : AnyObject] {
            self.hasCourseInstance = SOCourseInstance(dictionary: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.courseCode {
            dictionary[Keys.courseCode] = value as AnyObject
        }
        if let value = self.coursePrerequisites {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.coursePrerequisites] = values as AnyObject
        }
        if let value = self.hasCourseInstance as? SOCourseInstance {
            dictionary[Keys.hasCourseInstance] = value.dictionary as AnyObject
        }
        return dictionary
    }
}
