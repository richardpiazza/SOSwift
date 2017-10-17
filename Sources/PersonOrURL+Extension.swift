import Foundation
import SOSwiftVocabulary

// MARK: - PersonOrURL

public extension KeyedEncodingContainer {
    public mutating func encodePersonOrURL(_ value: PersonOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodePersonsOrURLs(_ values: [PersonOrURL], forKey key: KeyedEncodingContainer.Key) throws {
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
    public func decodePersonOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> PersonOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOPerson.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPerson.self, from: data)
            }
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func decodePersonsOrURLsIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> [PersonOrURL]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [PersonOrURL]()
        
        do {
            let values = try self.decode([[String : AnyObject]].self, forKey: key)
            for value in values {
                if value["@type"] as? String == SOPerson.type {
                    let data = try JSONEncoder().encode(value)
                    let decodable = try JSONDecoder().decode(SOPerson.self, from: data)
                    decodables.append(decodable)
                }
            }
        } catch {
            print(error)
        }
        
        do {
            let values = try self.decode([URL].self, forKey: key)
            for value in values {
                decodables.append(value)
            }
        } catch {
            print(error)
        }
        
        return decodables
    }
}
