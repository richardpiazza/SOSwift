import Foundation
import SOSwiftVocabulary

/// A description of an educational course which may be offered as distinct instances at which take place at different times or take place at different locations, or be offered through different media or modes of study.
/// An educational course is a sequence of one or more educational events and/or creative works which aims to build knowledge, competence or ability of learners.
public class SOCourse: SOCreativeWork, Course {

    public override class var type: String {
        return "Course"
    }
    
    /// The identifier for the Course used by the course provider (e.g. CS101 or 6.001).
    public var courseCode: String?
    /// Requirements for taking the Course. May be completion of another Course or a textual description like "permission of instructor". Requirements may be a pre-requisite competency, referenced using AlignmentObject.
    public var coursePrerequisites: [AlignmentObjectOrCourseOrText]?
    /// An offering of the course at a specific time and place or through specific media or mode of study or to a specific section of students.
    public var courseInstance: CourseInstance?
    
    private enum CodingKeys: String, CodingKey {
        case courseCode
        case coursePrerequisites
        case courseInstance = "hasCourseInstance"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.courseCode = try container.decodeIfPresent(String.self, forKey: .courseCode)
        self.coursePrerequisites = try container.decodeAlignmentObjectsOrCoursesOrTextsIfPresent(forKey: .coursePrerequisites)
        self.courseInstance = try container.decodeIfPresent(SOCourseInstance.self, forKey: .courseInstance)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.courseCode, forKey: .courseCode)
        try container.encodeIfPresent(self.coursePrerequisites, forKey: .coursePrerequisites)
        try container.encodeIfPresent(self.courseInstance, forKey: .courseInstance)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Course?, forKey key: K) throws {
        if let typedValue = value as? SOCourse {
            try self.encode(typedValue, forKey: key)
        }
    }
}
