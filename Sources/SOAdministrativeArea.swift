import Foundation
import SOSwiftVocabulary

/// A geographical region, typically under the jurisdiction of a particular government.
public class SOAdministrativeArea: SOPlace, AdministrativeArea {
    
    public override class var type: String {
        return "AdministrativeArea"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: AdministrativeArea?, forKey key: K) throws {
        if let typedValue = value as? SOAdministrativeArea {
            try self.encode(typedValue, forKey: key)
        }
    }
}
