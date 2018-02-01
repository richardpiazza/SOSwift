import Foundation
import SOSwiftVocabulary_ObjC

/// An educational organization.
public class SOEducationalOrganization: SOOrganization, EducationalOrganization {
    
    public override class var type: String {
        return "EducationalOrganization"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: EducationalOrganization?, forKey key: K) throws {
        if let typedValue = value as? SOEducationalOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
}
