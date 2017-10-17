import Foundation
import SOSwiftVocabulary

// MARK: - Encodable

public extension KeyedEncodingContainer {
    public mutating func encodeAreaServed(_ value: AreaServed, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOAdministrativeArea {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeAreaServedIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> AreaServed? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOAdministrativeArea.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOAdministrativeArea.self, from: data)
            } else if value["@type"] as? String == SOGeoShape.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOGeoShape.self, from: data)
            } else if value["@type"] as? String == SOPlace.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPlace.self, from: data)
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
