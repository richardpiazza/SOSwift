import Foundation
import SOSwiftVocabulary

/// An instance of a Course which is distinct from other instances because it is offered at a different time or location or through different media or modes of study or to a specific section of students.
public class SOCourseInstance: SOEvent, CourseInstance {

    public override class var type: String {
        return "CourseInstance"
    }
    
    /// The medium or means of delivery of the course instance or the mode of study, either as a text label (e.g. "online", "onsite" or "blended"; "synchronous" or "asynchronous"; "full-time" or "part-time") or as a URL reference to a term from a controlled vocabulary
    public var courseMode: TextOrURL?
    /// A person assigned to instruct or provide instructional assistance for the CourseInstance.
    public var instructor: Person?
    
    private enum CodingKeys: String, CodingKey {
        case courseMode
        case instructor
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeTextOrURLIfPresent(forKey: .courseMode) {
            self.courseMode = value
        }
        if let value = try container.decodeIfPresent(SOPerson.self, forKey: .instructor) {
            self.instructor = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.courseMode {
            try container.encodeTextOrURL(value, forKey: .courseMode)
        }
        if let value = self.instructor as? SOPerson {
            try container.encode(value, forKey: .instructor)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}

