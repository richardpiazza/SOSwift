import Foundation
import SOSwiftVocabulary

public class SOOffer: SOIntangible, Offer {
    
    public override class var type: String {
        return "Offer"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Offer?, forKey key: K) throws {
        if let typedValue = value as? SOOffer {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Offer]?, forKey key: K) throws {
        if let typedValue = value as? [SOOffer] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
