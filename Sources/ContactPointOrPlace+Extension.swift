import Foundation
import SOSwiftVocabulary

// MARK: - ContactPointOrPlace

public extension KeyedEncodingContainer {
    public mutating func encodeContactPointOrPlace(_ value: ContactPointOrPlace, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOContactPoint {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeContactPointOrPlaceIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ContactPointOrPlace? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOContactPoint.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOContactPoint.self, from: data)
            } else if value["@type"] as? String == SOPlace.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPlace.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
