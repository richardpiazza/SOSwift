import Foundation
import SOSwiftVocabulary_ObjC

/// A profession, may involve prolonged training and/or a formal qualification.
public class SOOccupation: SOIntangible, Occupation {
    
    public override class var type: String {
        return "Occupation"
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
    public mutating func encodeIfPresent(_ value: Occupation?, forKey key: K) throws {
        if let typedValue = value as? SOOccupation {
            try self.encode(typedValue, forKey: key)
        }
    }
}

