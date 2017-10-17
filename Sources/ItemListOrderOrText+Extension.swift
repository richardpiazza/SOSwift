import Foundation
import SOSwiftVocabulary

// MARK: - ItemListOrderOrText

public extension KeyedEncodingContainer {
    public mutating func encodeItemListOrderOrText(_ value: ItemListOrderOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? ItemListOrder {
            try self.encode(typedValue.rawValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeItemListOrderOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ItemListOrderOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeIfPresent(String.self, forKey: key) {
                return ItemListOrder(rawValue: value) ?? value
            }
        } catch {
        }
        
        return nil
    }
}
