import Foundation
import SOSwiftVocabulary

// MARK: - ContactPointOrPlace

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ContactPointOrPlace?, forKey key: K) throws {
        if let typedValue = value as? SOContactPoint {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeContactPointOrPlaceIfPresent(forKey key: K) throws -> ContactPointOrPlace? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOContactPoint.type {
                return try self.decode(SOContactPoint.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPlace.type {
                return try self.decode(SOPlace.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `ContactPointOrPlace` for key: \(key.stringValue).")
        
        return nil
    }
}
