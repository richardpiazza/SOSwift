import Foundation
import SOSwiftVocabulary

// MARK: - AreaServed

public extension KeyedEncodingContainer {
    public mutating func encodeAreaServed(_ value: AreaServed, forKey key: K) throws {
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
    public func decodeAreaServedIfPresent(forKey key: K) throws -> AreaServed? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOAdministrativeArea.type {
                return try self.decode(SOAdministrativeArea.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOGeoShape.type {
                return try self.decode(SOGeoShape.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPlace.type {
                return try self.decode(SOPlace.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `AreaServed` for key: \(key.stringValue).")
        
        return nil
    }
}
