import Foundation
import SOSwiftVocabulary

// MARK: - GeoCoordinatesOrGeoShape

public extension KeyedEncodingContainer {
    public mutating func encodeGeoCoordinatesOrGeoShape(_ value: GeoCoordinatesOrGeoShape, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOGeoCoordinates {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeGeoCoordinatesOrGeoShapeIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> GeoCoordinatesOrGeoShape? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOGeoCoordinates.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOGeoCoordinates.self, from: data)
            } else if value["@type"] as? String == SOGeoShape.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOGeoShape.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
