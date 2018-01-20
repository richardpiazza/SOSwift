import Foundation
import SOSwiftVocabulary

public class SOLanguage: SOIntangible, Language {
    
    public override class var type: String {
        return "Language"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
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
    public mutating func encodeIfPresent(_ value: Language?, forKey key: K) throws {
        if let typedValue = value as? SOLanguage {
            try self.encode(typedValue, forKey: key)
        }
    }
}
