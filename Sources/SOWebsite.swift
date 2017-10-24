import Foundation
import SOSwiftVocabulary

public class SOWebsite: SOCreativeWork, Website {
    
    public override class var type: String {
        return "Website"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Website?, forKey key: K) throws {
        if let typedValue = value as? SOWebsite {
            try self.encode(typedValue, forKey: key)
        }
    }
}
