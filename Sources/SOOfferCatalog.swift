import Foundation
import SOSwiftVocabulary

/// An OfferCatalog is an ItemList that contains related Offers and/or further OfferCatalogs that are offeredBy the same provider.
public class SOOfferCatalog: SOItemList, OfferCatalog {
    
    public override class var type: String {
        return "OfferCatalog"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: OfferCatalog?, forKey key: K) throws {
        if let typedValue = value as? SOOfferCatalog {
            try self.encode(typedValue, forKey: key)
        }
    }
}
