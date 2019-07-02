import Foundation

public class AlignmentObject: Intangible {
    
    /// A category of alignment between the learning resource and the framework node.
    /// Recommended values include: 'assesses', 'teaches', 'requires', 'textComplexity',
    /// 'readingLevel', 'educationalSubject', and 'educationalLevel'.
    public var alignmentType: String?
    
    /// The framework to which the resource being described is aligned.
    public var educationalFramework: String?
    
    /// The description of a node in an established educational framework.
    public var targetDescription: String?
    
    /// The name of a node in an established educational framework.
    public var targetName: String?
    
    /// The URL of a node in an established educational framework.
    public var targetUrl: URL?
    
    internal enum AlignmentObjectCodingKeys: String, CodingKey {
        case alignmentType
        case educationalFramework
        case targetDescription
        case targetName
        case targetUrl
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: AlignmentObjectCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AlignmentObjectCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
