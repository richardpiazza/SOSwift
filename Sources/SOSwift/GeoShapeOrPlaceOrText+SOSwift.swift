import Foundation
import SOSwiftVocabulary

// MARK: - GeoShapeOrPlaceOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: GeoShapeOrPlaceOrText?, forKey key: K) throws {
        if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeGeoShapeOrPlaceOrTextIfPresent(forKey key: K) throws -> GeoShapeOrPlaceOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOGeoShape.type {
                return try self.decode(SOGeoShape.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOThing.type {
                return try self.decode(SOPlace.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode 'GeoShapeOrPlaceOrText' for key: \(key.stringValue).")
        
        return nil
    }
}
