import Foundation
import SOSwiftVocabulary

// MARK: - SoftwareApplicationOrWebsite

public extension KeyedEncodingContainer {
    public mutating func encodeSoftwareApplicationOrWebsite(_ value: SoftwareApplicationOrWebsite, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOSoftwareApplication {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOWebsite {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeSoftwareApplicationOrWebsiteIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> SoftwareApplicationOrWebsite? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOSoftwareApplication.type {
                return try JSONDecoder().decode(SOSoftwareApplication.self, from: data)
            } else if value["@type"] as? String == SOWebsite.type {
                return try JSONDecoder().decode(SOWebsite.self, from: data)
            }
        } catch {
        }
        
        return nil
    }
}
