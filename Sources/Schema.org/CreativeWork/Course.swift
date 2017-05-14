import Foundation

public protocol CourseConformance:
                    AlignmentObjectOrCourseOrText
                {}

public protocol Course: CreativeWork, CourseConformance {
    var courseCode: String? { get set }
    var coursePrerequisites: [AlignmentObjectOrCourseOrText]? { get set }
    var hasCourseInstance: CourseInstance? { get set }
}

