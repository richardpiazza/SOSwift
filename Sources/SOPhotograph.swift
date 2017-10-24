import Foundation
import SOSwiftVocabulary

/// A photograph.
public class SOPhotograph: SOCreativeWork, Photograph {
    
    public override class var type: String {
        return "Photograph"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Photograph?, forKey key: K) throws {
        if let typedValue = value as? SOPhotograph {
            try self.encode(typedValue, forKey: key)
        }
    }
}
