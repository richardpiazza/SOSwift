import Foundation
import SOSwiftVocabulary

public class SOAlignmentObject: SOIntangible, AlignmentObject {
    override public class var type: String {
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
}
