import Foundation
import SOSwiftVocabulary

// MARK: - GeoCoordinatesOrGeoShape

public extension KeyedEncodingContainer {
    public mutating func encodeGeoCoordinatesOrGeoShape(_ value: GeoCoordinatesOrGeoShape, forKey key: K) throws {
        if let typedValue = value as? SOGeoCoordinates {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeGeoCoordinatesOrGeoShapeIfPresent(forKey key: K) throws -> GeoCoordinatesOrGeoShape? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOGeoCoordinates.type {
                return try self.decode(SOGeoCoordinates.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOGeoShape.type {
                return try self.decode(SOGeoShape.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `GeoCoordinatesOrGeoShape` for key: \(key.stringValue).")
        
        return nil
    }
}
