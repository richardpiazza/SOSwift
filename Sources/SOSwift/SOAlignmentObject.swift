import Foundation
import SOSwiftVocabulary

public class SOAlignmentObject: SOIntangible, AlignmentObject {
    
    public override class var type: String {
        return "AlignmentObject"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.alignmentType = try container.decodeIfPresent(String.self, forKey: .alignmentType)
        self.educationalFramework = try container.decodeIfPresent(String.self, forKey: .educationalFramework)
        self.targetDescription = try container.decodeIfPresent(String.self, forKey: .targetDescription)
        self.targetName = try container.decodeIfPresent(String.self, forKey: .targetName)
        self.targetUrl = try container.decodeIfPresent(URL.self, forKey: .targetUrl)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.alignmentType, forKey: .alignmentType)
        try container.encodeIfPresent(self.educationalFramework, forKey: .educationalFramework)
        try container.encodeIfPresent(self.targetDescription, forKey: .targetDescription)
        try container.encodeIfPresent(self.targetName, forKey: .targetName)
        try container.encodeIfPresent(self.targetUrl, forKey: .targetUrl)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.alignmentType.rawValue:
            return "A category of alignment between the learning resource and the framework node."
        case CodingKeys.educationalFramework.rawValue:
            return "The framework to which the resource being described is aligned."
        case CodingKeys.targetDescription.rawValue:
            return "The description of a node in an established educational framework."
        case CodingKeys.targetName.rawValue:
            return "The name of a node in an established educational framework."
        case CodingKeys.targetUrl.rawValue:
            return "The URL of a node in an established educational framework."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.alignmentType.rawValue:
            setAlignmentType(value)
        case CodingKeys.educationalFramework.rawValue:
            setEducationalFramework(value)
        case CodingKeys.targetDescription.rawValue:
            setTargetDescription(value)
        case CodingKeys.targetName.rawValue:
            setTargetName(value)
        case CodingKeys.targetUrl.rawValue:
            setTargetURL(value)
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension SOAlignmentObject {
    public func setAlignmentType(_ value: Any?) {
        guard let nonNil = value else {
            self.alignmentType = nil
            return
        }
        
        guard let typedValue = nonNil as? String else {
            return
        }
        
        self.alignmentType = typedValue
    }
    
    public func setEducationalFramework(_ value: Any?) {
        guard let nonNil = value else {
            self.educationalFramework = nil
            return
        }
        
        guard let typedValue = nonNil as? String else {
            return
        }
        
        self.educationalFramework = typedValue
    }
    
    public func setTargetDescription(_ value: Any?) {
        guard let nonNil = value else {
            self.targetDescription = nil
            return
        }
        
        guard let typedValue = nonNil as? String else {
            return
        }
        
        self.targetDescription = typedValue
    }
    
    public func setTargetName(_ value: Any?) {
        guard let nonNil = value else {
            self.targetName = nil
            return
        }
        
        guard let typedValue = nonNil as? String else {
            return
        }
        
        self.targetName = typedValue
    }
    
    public func setTargetURL(_ value: Any?) {
        guard let nonNil = value else {
            self.targetUrl = nil
            return
        }
        
        guard let typedValue = nonNil as? URL else {
            return
        }
        
        self.targetUrl = typedValue
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: AlignmentObject?, forKey key: K) throws {
        if let typedValue = value as? SOAlignmentObject {
            try self.encode(typedValue, forKey: key)
        }
    }
}
