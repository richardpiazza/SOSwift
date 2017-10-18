import Foundation
import SOSwiftVocabulary

/// Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.
public class SOStructuredValue: SOIntangible, StructuredValue {
    
    public override class var type: String {
        return "StructuredValue"
    }
    
//    public required init(from decoder: Decoder) throws {
//        try super.init(from: decoder)
//    }
//    
//    public override func encode(to encoder: Encoder) throws {
//        try super.encode(to: encoder)
//    }
}
