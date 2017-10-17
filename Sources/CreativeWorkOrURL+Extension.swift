import Foundation
import SOSwiftVocabulary

// MARK: - CreativeWorkOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeCreativeWorkOrURL(_ value: CreativeWorkOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeCreativeWorkOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> CreativeWorkOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(SOCreativeWork.self, forKey: key)
            return value
//            let value = try self.decode([String : AnyObject].self, forKey: key)
//            if value["@type"] as? String == SOCreativeWork.type {
//
//            }
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
