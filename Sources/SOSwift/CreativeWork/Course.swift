import Foundation

/// A description of an educational course which may be offered as distinct
/// instances at which take place at different times or take place at different
/// locations, or be offered through different media or modes of study.
///
/// An educational course is a sequence of one or more educational events
/// and/or creative works which aims to build knowledge, competence or ability
/// of learners.
public class Course: CreativeWork {

    /// The identifier for the Course used by the course provider (e.g. CS101 or 6.001).
    public var courseCode: String?

    /// Requirements for taking the Course. May be completion of another Course
    /// or a textual description like "permission of instructor". Requirements may
    /// be a pre-requisite competency, referenced using AlignmentObject.
    public var coursePrerequisites: [AlignmentObjectOrCourseOrText]?

    /// An offering of the course at a specific time and place or through specific
    /// media or mode of study or to a specific section of students.
    public var courseInstance: CourseInstance?

    enum CourseCodingKeys: String, CodingKey {
        case courseCode
        case coursePrerequisites
        case courseInstance = "hasCourseInstance"
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: CourseCodingKeys.self)

        courseCode = try container.decodeIfPresent(String.self, forKey: .courseCode)
        coursePrerequisites = try container.decodeIfPresent([AlignmentObjectOrCourseOrText].self, forKey: .coursePrerequisites)
        courseInstance = try container.decodeIfPresent(CourseInstance.self, forKey: .courseInstance)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CourseCodingKeys.self)

        try container.encodeIfPresent(courseCode, forKey: .courseCode)
        try container.encodeIfPresent(coursePrerequisites, forKey: .coursePrerequisites)
        try container.encodeIfPresent(courseInstance, forKey: .courseInstance)

        try super.encode(to: encoder)
    }
}
