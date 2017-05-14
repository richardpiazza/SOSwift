import Foundation

public protocol SchemaCourseInstance: SchemaEvent {
    var courseMode: TextOrURL? { get set }
    var instructor: SchemaPerson? { get set }
}
