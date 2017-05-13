import Foundation

public protocol SchemaCourseInstance: SchemaEvent {
    var courseMode: SchemaTextOrURL? { get set }
    var instructor: SchemaPerson? { get set }
}
