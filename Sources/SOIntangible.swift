import Foundation
import SOSwiftVocabulary

/// A utility class that serves as the umbrella for a number of 'intangible' things such as quantities, structured values, etc.
public class SOIntangible: SOThing, Intangible {
    override public class var type: String {
        return "Intangible"
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}
