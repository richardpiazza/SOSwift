import Foundation

public protocol SchemaCourse: SchemaCreativeWork, AlignmentObjectOrCourseOrText {
    var courseCode: String? { get set }
    var coursePrerequisites: [AlignmentObjectOrCourseOrText]? { get set }
    var hasCourseInstance: SchemaCourseInstance? { get set }
}

