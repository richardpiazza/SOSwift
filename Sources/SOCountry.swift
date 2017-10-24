import Foundation
import SOSwiftVocabulary

/// A country.
public class SOCountry: SOAdministrativeArea, Country {
    
    public override class var type: String {
        return "Country"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Country?, forKey key: K) throws {
        if let typedValue = value as? SOCountry {
            try self.encode(typedValue, forKey: key)
        }
    }
}
