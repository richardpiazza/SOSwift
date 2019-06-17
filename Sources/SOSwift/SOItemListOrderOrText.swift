import Foundation
import SOSwiftVocabulary

// MARK: - ItemListOrderOrText

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ItemListOrderOrText?, forKey key: K) throws {
        if let typedValue = value as? ItemListOrder {
            try self.encode(typedValue.rawValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeItemListOrderOrTextIfPresent(forKey key: K) throws -> ItemListOrderOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeIfPresent(String.self, forKey: key) {
                return ItemListOrder(rawValue: value) ?? value
            }
        } catch {
        }
        
        print("Failed to decode `ItemListOrderOrText` for key: \(key.stringValue).")
        
        return nil
    }
}