import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - CountryOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: CountryOrText?, forKey key: K) throws {
        if let typedValue = value as? SOCountry {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeCountryOrTextIfPresent(forKey key: K) throws -> CountryOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOCountry.type {
                return try self.decode(SOCountry.self, forKey: key)
            }
        } catch {
        }
        
        do {
            if let value = try self.decodeIfPresent(String.self, forKey: key) {
                return value as NSString
            }
        } catch {
        }
        
        print("Failed to decode `CountryOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
