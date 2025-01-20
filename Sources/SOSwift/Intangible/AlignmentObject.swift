import Foundation

/// An intangible item that describes an alignment between a learning resource and a node in an educational framework.
public class AlignmentObject: Intangible {

    /// A category of alignment between the learning resource and the framework node.
    ///
    /// Recommended values include: 'assesses', 'teaches', 'requires', 'textComplexity', 'readingLevel',
    /// 'educationalSubject', and 'educationalLevel'.
    public var alignmentType: String?

    /// The framework to which the resource being described is aligned.
    public var educationalFramework: String?

    /// The description of a node in an established educational framework.
    public var targetDescription: String?

    /// The name of a node in an established educational framework.
    public var targetName: String?

    /// The URL of a node in an established educational framework.
    public var targetUrl: URL?

    enum AlignmentObjectCodingKeys: String, CodingKey {
        case alignmentType
        case educationalFramework
        case targetDescription
        case targetName
        case targetUrl
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: AlignmentObjectCodingKeys.self)

        alignmentType = try container.decodeIfPresent(String.self, forKey: .alignmentType)
        educationalFramework = try container.decodeIfPresent(String.self, forKey: .educationalFramework)
        targetDescription = try container.decodeIfPresent(String.self, forKey: .targetDescription)
        targetName = try container.decodeIfPresent(String.self, forKey: .targetName)
        targetUrl = try container.decodeIfPresent(URL.self, forKey: .targetUrl)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AlignmentObjectCodingKeys.self)

        try container.encodeIfPresent(alignmentType, forKey: .alignmentType)
        try container.encodeIfPresent(educationalFramework, forKey: .educationalFramework)
        try container.encodeIfPresent(targetDescription, forKey: .targetDescription)
        try container.encodeIfPresent(targetName, forKey: .targetName)
        try container.encodeIfPresent(targetUrl, forKey: .targetUrl)

        try super.encode(to: encoder)
    }
}
