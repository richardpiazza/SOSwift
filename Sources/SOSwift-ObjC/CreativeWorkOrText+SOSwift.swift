import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - CreativeWorkOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: CreativeWorkOrText?, forKey key: K) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeCreativeWorkOrTextIfPresent(forKey key: K) throws -> CreativeWorkOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOCreativeWork.type {
                return try self.decode(SOCreativeWork.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key) as NSString
            return value
        } catch {
        }
        
        print("Failed to decode `CreativeWorkOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
