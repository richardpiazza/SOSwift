import Foundation
import SOSwiftVocabulary

// MARK: - CreativeWorkOrText

public extension KeyedEncodingContainer {
    public mutating func encodeCreativeWorkOrText(_ value: CreativeWorkOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeCreativeWorkOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> CreativeWorkOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOCreativeWork.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOCreativeWork.self, from: data)
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
