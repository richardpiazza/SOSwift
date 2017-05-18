import Foundation

/// An instance of a Course which is distinct from other instances because it is offered at a different time or location or through different media or modes of study or to a specific section of students.
public class SOCourseInstance: SOEvent, CourseInstance {
    public struct Keys {
        public static let courseMode = "courseMode"
        public static let instructor = "instructor"
    }
    
    override public class var type: String {
        return "CourseInstance"
    }
    
    /// The medium or means of delivery of the course instance or the mode of study, either as a text label (e.g. "online", "onsite" or "blended"; "synchronous" or "asynchronous"; "full-time" or "part-time") or as a URL reference to a term from a controlled vocabulary
    public var courseMode: TextOrURL?
    /// A person assigned to instruct or provide instructional assistance for the CourseInstance.
    public var instructor: Person?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.courseMode] {
            self.courseMode = makeTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.instructor] as? [String : AnyObject] {
            self.instructor = SOPerson(dictionary: value)
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.courseMode?.dictionaryValue {
            dictionary[Keys.courseMode] = value
        }
        if let value = self.instructor?.dictionary {
            dictionary[Keys.instructor] = value as AnyObject
        }
        return dictionary
    }
}

