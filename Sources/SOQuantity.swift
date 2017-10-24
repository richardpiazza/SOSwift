import Foundation
import SOSwiftVocabulary

/// Quantities such as distance, time, mass, weight, etc. Particular instances of say Mass are entities like '3 Kg' or '4 milligrams'.
public class SOQuantity: SOIntangible, Quantity {
    
    public override class var type: String {
        return "Quantity"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Quantity?, forKey key: K) throws {
        if let typedValue = value as? SOQuantity {
            try self.encode(typedValue, forKey: key)
        }
    }
}
