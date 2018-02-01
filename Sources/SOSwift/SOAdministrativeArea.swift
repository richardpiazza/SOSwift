import Foundation
import SOSwiftVocabulary

/// A geographical region, typically under the jurisdiction of a particular government.
public class SOAdministrativeArea: SOPlace, AdministrativeArea {
    
    public override class var type: String {
        return "AdministrativeArea"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [SOCountry.self]
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: AdministrativeArea?, forKey key: K) throws {
        if let typedValue = value as? SOAdministrativeArea {
            try self.encode(typedValue, forKey: key)
        }
    }
}
