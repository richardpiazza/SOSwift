import Foundation

public protocol SchemaCourse: SchemaCreativeWork, SchemaAlignmentObjectOrCourseOrText {
    var courseCode: String? { get set }
    var coursePrerequisites: [SchemaAlignmentObjectOrCourseOrText]? { get set }
    var hasCourseInstance: SchemaCourseInstance? { get set }
}

