import Foundation
import SOSwiftVocabulary

// MARK: - PlaceOrPostalAddressOrText

public extension KeyedEncodingContainer {
    public mutating func encodePlaceOrPostalAddressOrText(_ value: PlaceOrPostalAddressOrText, forKey key: K) throws {
        if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPostalAddress {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodePlaceOrPostalAddressOrTextIfPresent(forKey key: K) throws -> PlaceOrPostalAddressOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOPlace.type {
                return try self.decode(SOPlace.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPostalAddress.type {
                return try self.decode(SOPostalAddress.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `PlaceOrPostalAddressOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
