import Foundation
import SOSwiftVocabulary

/// Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.
public class SOStructuredValue: SOIntangible, StructuredValue {
    
    public override class var type: String {
        return "StructuredValue"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: StructuredValue?, forKey key: K) throws {
        if let typedValue = value as? SOStructuredValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}
