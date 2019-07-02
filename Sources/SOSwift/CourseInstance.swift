import Foundation

/// An instance of a Course which is distinct from other instances because
/// it is offered at a different time or location or through different media or
/// modes of study or to a specific section of students.
public class CourseInstance: Event {
    
    /// The medium or means of delivery of the course instance or the mode
    /// of study, either as a text label (e.g. "online", "onsite" or "blended";
    /// "synchronous" or "asynchronous"; "full-time" or "part-time") or as a URL
    /// reference to a term from a controlled vocabulary
    public var courseMode: URLOrText?
    
    /// A person assigned to instruct or provide instructional assistance for
    /// the CourseInstance.
    public var instructor: Person?
    
    internal enum CourseInstanceCodingKeys: String, CodingKey {
        case courseMode
        case instructor
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CourseInstanceCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CourseInstanceCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
