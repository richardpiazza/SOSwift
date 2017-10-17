import Foundation
import SOSwiftVocabulary

public class SOAlignmentObject: SOIntangible, AlignmentObject {
    
    public override class var type: String {
        return "AlignmentObject"
    }
    
    /// A category of alignment between the learning resource and the framework node. Recommended values include: 'assesses', 'teaches', 'requires', 'textComplexity', 'readingLevel', 'educationalSubject', and 'educationalLevel'.
    public var alignmentType: String?
    /// The framework to which the resource being described is aligned.
    public var educationalFramework: String?
    /// The description of a node in an established educational framework.
    public var targetDescription: String?
    /// The name of a node in an established educational framework.
    public var targetName: String?
    /// The URL of a node in an established educational framework.
    public var targetUrl: URL?
    
    private enum CodingKeys: String, CodingKey {
        case alignmentType
        case educationalFramework
        case targetDescription
        case targetName
        case targetUrl
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .alignmentType) {
            self.alignmentType = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .educationalFramework) {
            self.educationalFramework = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .targetDescription) {
            self.targetDescription = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .targetName) {
            self.targetName = value
        }
        if let value = try container.decodeIfPresent(URL.self, forKey: .targetUrl) {
            self.targetUrl = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.alignmentType {
            try container.encode(value, forKey: .alignmentType)
        }
        if let value = self.educationalFramework {
            try container.encode(value, forKey: .educationalFramework)
        }
        if let value = self.targetDescription {
            try container.encode(value, forKey: .targetDescription)
        }
        if let value = self.targetName {
            try container.encode(value, forKey: .targetName)
        }
        if let value = self.targetUrl {
            try container.encode(value, forKey: .targetUrl)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
