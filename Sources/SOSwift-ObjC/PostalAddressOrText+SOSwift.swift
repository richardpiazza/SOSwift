import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - PostalAddressOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PostalAddressOrText?, forKey key: K) throws {
        if let typedValue = value as? SOPostalAddress {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodePostalAddressOrTextIfPresent(forKey key: K) throws -> PostalAddressOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOPostalAddress.type {
                return try self.decode(SOPostalAddress.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value as NSString
        } catch {
        }
        
        print("Failed to decode `PostalAddressOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
