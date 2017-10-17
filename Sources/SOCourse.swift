import Foundation
import SOSwiftVocabulary

/// A description of an educational course which may be offered as distinct instances at which take place at different times or take place at different locations, or be offered through different media or modes of study.
/// An educational course is a sequence of one or more educational events and/or creative works which aims to build knowledge, competence or ability of learners.
public class SOCourse: SOCreativeWork, Course {

    override public class var type: String {
        return "Course"
    }
    
    /// The identifier for the Course used by the course provider (e.g. CS101 or 6.001).
    public var courseCode: String?
    /// Requirements for taking the Course. May be completion of another Course or a textual description like "permission of instructor". Requirements may be a pre-requisite competency, referenced using AlignmentObject.
    public var coursePrerequisites: [AlignmentObjectOrCourseOrText]?
    /// An offering of the course at a specific time and place or through specific media or mode of study or to a specific section of students.
    public var hasCourseInstance: CourseInstance?
    
    private enum CodingKeys: String, CodingKey {
        case courseCode
        case coursePrerequisites
        case hasCourseInstance
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .courseCode) {
            self.courseCode = value
        }
        if let value = try container.decodeAlignmentObjectsOrCoursesOrTextsIfPresent(forKey: .coursePrerequisites) {
            self.coursePrerequisites = value
        }
        if let value = try container.decodeIfPresent(SOCourseInstance.self, forKey: .hasCourseInstance) {
            self.hasCourseInstance = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.courseCode {
            try container.encode(value, forKey: .courseCode)
        }
        if let value = self.coursePrerequisites {
            try container.encodeAlignmentObjectsOrCoursesOrTexts(value, forKey: .coursePrerequisites)
        }
        if let value = self.hasCourseInstance as? SOCourseInstance {
            try container.encode(value, forKey: .hasCourseInstance)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
