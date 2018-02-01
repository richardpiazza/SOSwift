import Foundation
import SOSwiftVocabulary_ObjC

/// An instance of a Course which is distinct from other instances because it is offered at a different time or location or through different media or modes of study or to a specific section of students.
public class SOCourseInstance: SOEvent, CourseInstance {

    public override class var type: String {
        return "CourseInstance"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The medium or means of delivery of the course instance or the mode of study, either as a text label (e.g. "online", "onsite" or "blended"; "synchronous" or "asynchronous"; "full-time" or "part-time") or as a URL reference to a term from a controlled vocabulary
    public var courseMode: URLOrText?
    /// A person assigned to instruct or provide instructional assistance for the CourseInstance.
    public var instructor: Person?
    
    private enum CodingKeys: String, CodingKey {
        case courseMode
        case instructor
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.courseMode = try container.decodeURLOrTextIfPresent(forKey: .courseMode)
        self.instructor = try container.decodeIfPresent(SOPerson.self, forKey: .instructor)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.courseMode, forKey: .courseMode)
        try container.encodeIfPresent(self.instructor, forKey: .instructor)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: CourseInstance?, forKey key: K) throws {
        if let typedValue = value as? SOCourseInstance {
            try self.encode(typedValue, forKey: key)
        }
    }
}

