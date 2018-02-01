import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - ItemListOrderOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: ItemListOrderOrText?, forKey key: K) throws {
        if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeItemListOrderOrTextIfPresent(forKey key: K) throws -> ItemListOrderOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeIfPresent(String.self, forKey: key) {
                if let ilo = ItemListOrder(stringValue: value) {
                    return ilo.rawValue as NSNumber
                }
                
                return value as NSString
            }
        } catch {
        }
        
        print("Failed to decode `ItemListOrderOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
