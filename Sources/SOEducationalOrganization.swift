import Foundation
import SOSwiftVocabulary

/// An educational organization.
public class SOEducationalOrganization: SOOrganization, EducationalOrganization {
    
    public override class var type: String {
        return "EducationalOrganization"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: EducationalOrganization?, forKey key: K) throws {
        if let typedValue = value as? SOEducationalOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
}
