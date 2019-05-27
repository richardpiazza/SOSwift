import Foundation
import SOSwiftVocabulary

// MARK: - SoftwareApplicationOrWebsite

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: SoftwareApplicationOrWebsite?, forKey key: K) throws {
        if let typedValue = value as? SOSoftwareApplication {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOWebsite {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeSoftwareApplicationOrWebsiteIfPresent(forKey key: K) throws -> SoftwareApplicationOrWebsite? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOSoftwareApplication.type {
                return try self.decode(SOSoftwareApplication.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOWebsite.type {
                return try self.decode(SOWebsite.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `SoftwareApplicationOrWebsite` for key: \(key.stringValue).")
        
        return nil
    }
}
