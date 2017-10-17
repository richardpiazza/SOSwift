import Foundation
import SOSwiftVocabulary

// MARK: - DistanceOrQuantitativeValue

public extension KeyedEncodingContainer {
    public mutating func encodeDistanceOrQuantitativeValue(_ value: DistanceOrQuantitativeValue, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SODistance {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOQuantitativeValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDistanceOrQuantitativeValueIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> DistanceOrQuantitativeValue? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SODistance.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SODistance.self, from: data)
            } else if value["@type"] as? String == SOQuantitativeValue.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOQuantitativeValue.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
