import Foundation
import SOSwiftVocabulary

// MARK: - PersonOrURL

public extension KeyedEncodingContainer {
    public mutating func encodePersonOrURL(_ value: PersonOrURL, forKey key: K) throws {
        if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodePersonsOrURLs(_ values: [PersonOrURL], forKey key: K) throws {
        var encodables = [Encodable]()
        
        for value in values {
            if let typedValue = value as? SOPerson {
                encodables.append(typedValue)
            } else if let typedValue = value as? URL {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodePersonOrURLIfPresent(forKey key: K) throws -> PersonOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOPerson.type {
                return try self.decode(SOPerson.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value
            }
        } catch {
        }
        
        print("Failed to decode `PersonOrURL` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodePersonsOrURLsIfPresent(forKey key: K) throws -> [PersonOrURL]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [PersonOrURL]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    if dictionary[SOThing.Keywords.type] as? String == SOPerson.type {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                        let decodable = try JSONDecoder().decode(SOPerson.self, from: data)
                        decodables.append(decodable)
                    }
                } else if let value = element as? String {
                    if let data = value.data(using: .utf8) {
                        let decodable = try JSONDecoder().decode(URL.self, from: data)
                        decodables.append(decodable)
                    }
                }
            }
        } catch {
        }
        
        print("Failed to decode `[PersonOrURL]` for key: \(key.stringValue).")
        
        return decodables
    }
}
