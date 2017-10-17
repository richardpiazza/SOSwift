import Foundation
import SOSwiftVocabulary

// MARK: - PostalAddressOrText

public extension KeyedEncodingContainer {
    public mutating func encodePostalAddressOrText(_ value: PostalAddressOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOPostalAddress {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodePostalAddressOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> PostalAddressOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOPostalAddress.type {
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
