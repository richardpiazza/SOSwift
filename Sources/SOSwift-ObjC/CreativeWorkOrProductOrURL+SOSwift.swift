import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - CreativeWorkOrProductOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: CreativeWorkOrProductOrURL?, forKey key: K) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeCreativeWorkOrProductOrURLIfPresent(forKey key: K) throws -> CreativeWorkOrProductOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOCreativeWork.type {
                return try self.decode(SOCreativeWork.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOProduct.type {
                return try self.decode(SOProduct.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key) as NSURL
            return value
        } catch {
        }
        
        print("Failed to decode `CreativeWorkOrProductOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
