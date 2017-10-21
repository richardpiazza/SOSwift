import Foundation
import SOSwiftVocabulary

// MARK: - DistanceOrQuantitativeValue

public extension KeyedEncodingContainer {
    public mutating func encodeDistanceOrQuantitativeValue(_ value: DistanceOrQuantitativeValue, forKey key: K) throws {
        if let typedValue = value as? SODistance {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOQuantitativeValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDistanceOrQuantitativeValueIfPresent(forKey key: K) throws -> DistanceOrQuantitativeValue? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SODistance.type {
                return try self.decode(SODistance.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOQuantitativeValue.type {
                return try self.decode(SOQuantitativeValue.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `DistanceOrQuantitativeValue` for key: \(key.stringValue).")
        
        return nil
    }
}
