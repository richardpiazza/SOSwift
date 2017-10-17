import Foundation
import SOSwiftVocabulary

// MARK: - PlaceOrPostalAddressOrText

public extension KeyedEncodingContainer {
    public mutating func encodePlaceOrPostalAddressOrText(_ value: PlaceOrPostalAddressOrText, forKey key: KeyedEncodingContainer.Key) throws {
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
    public func decodePlaceOrPostalAddressOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> PlaceOrPostalAddressOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOPlace.type {
                return try JSONDecoder().decode(SOPlace.self, from: data)
            } else if value["@type"] as? String == SOPostalAddress.type {
                return try JSONDecoder().decode(SOPostalAddress.self, from: data)
            }
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
