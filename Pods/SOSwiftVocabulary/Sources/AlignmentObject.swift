import Foundation

public protocol AlignmentObjectConformance:
                    AlignmentObjectOrCourseOrText
                {}

/// An intangible item that describes an alignment between a learning resource and a node in an educational framework.
public protocol AlignmentObject: Intangible, AlignmentObjectConformance {
    /// A category of alignment between the learning resource and the framework node. Recommended values include: 'assesses', 'teaches', 'requires', 'textComplexity', 'readingLevel', 'educationalSubject', and 'educationalLevel'.
    var alignmentType: String? { get set }
    /// The framework to which the resource being described is aligned.
    var educationalFramework: String? { get set }
    /// The description of a node in an established educational framework.
    var targetDescription: String? { get set }
    /// The name of a node in an established educational framework.
    var targetName: String? { get set }
    /// The URL of a node in an established educational framework.
    var targetUrl: URL? { get set }
}
