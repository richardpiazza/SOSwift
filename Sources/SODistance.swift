import Foundation
import SOSwiftVocabulary

/// Properties that take Distances as values are of the form '<Number> <Length unit of measure>'. E.g., '7 ft'.
public class SODistance: SOQuantity, Distance {
    
    public override class var type: String {
        return "Distance"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Distance?, forKey key: K) throws {
        if let typedValue = value as? SODistance {
            try self.encode(typedValue, forKey: key)
        }
    }
}
