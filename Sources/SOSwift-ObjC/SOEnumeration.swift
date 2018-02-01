import Foundation
import SOSwiftVocabulary_ObjC

/// Lists or enumerations—for example, a list of cuisines or music genres, etc.
public class SOEnumeration: SOIntangible, Enumeration {
    
    public override class var type: String {
        return "Enumeration"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return [
            SOQualitativeValue.self
        ]
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Enumeration?, forKey key: K) throws {
        if let typedValue = value as? SOEnumeration {
            try self.encode(typedValue, forKey: key)
        }
    }
}
