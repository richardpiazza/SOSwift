import Foundation

/// An instance of a Course which is distinct from other instances because it is offered at a different time or location or through different media or modes of study or to a specific section of students.
public class CourseInstance: Event, SchemaCourseInstance {
    override public var type: String {
        return "CourseInstance"
    }
    
    /// The medium or means of delivery of the course instance or the mode of study, either as a text label (e.g. "online", "onsite" or "blended"; "synchronous" or "asynchronous"; "full-time" or "part-time") or as a URL reference to a term from a controlled vocabulary
    public var courseMode: SchemaTextOrURL?
    /// A person assigned to instruct or provide instructional assistance for the CourseInstance.
    public var instructor: SchemaPerson?
}

