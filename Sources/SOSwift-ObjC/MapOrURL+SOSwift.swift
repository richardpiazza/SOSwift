import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - MapOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MapOrURL?, forKey key: K) throws {
        if let typedValue = value as? SOMap {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeMapOrURLIfPresent(forKey key: K) throws -> MapOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOMap.type {
                return try self.decode(SOMap.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value as NSURL
            }
        } catch {
        }
        
        print("Failed to decode `MapOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
