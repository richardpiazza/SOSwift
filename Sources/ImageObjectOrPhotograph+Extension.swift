import Foundation
import SOSwiftVocabulary

// MARK: - ImageObjectOrPhotograph

public extension KeyedEncodingContainer {
    public mutating func encodeImageObjectOrPhotograph(_ value: ImageObjectOrPhotograph, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOImageObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPhotograph {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeImageObjectsOrPhotographs(_ values: [ImageObjectOrPhotograph], forKey key: KeyedEncodingContainer.Key) throws {
        var encodables = [Encodable]()
        
        for value in values {
            if let typedValue = value as? SOImageObject {
                encodables.append(typedValue)
            } else if let typedValue = value as? SOPhotograph {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodeImageObjectOrPhotographIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ImageObjectOrPhotograph? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOImageObject.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOImageObject.self, from: data)
            } else if value["@type"] as? String == SOPhotograph.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPhotograph.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func decodeImageObjectsOrPhotographsIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> [ImageObjectOrPhotograph]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [ImageObjectOrPhotograph]()
        
        do {
            let values = try self.decode([[String : Any]].self, forKey: key)
            for value in values {
                let data = try JSONEncoder().encode(value)
                
                if value["@type"] as? String == SOImageObject.type {
                    let decodable = try JSONDecoder().decode(SOImageObject.self, from: data)
                    decodables.append(decodable)
                } else if value["@type"] as? String == SOPhotograph.type {
                    let decodable = try JSONDecoder().decode(SOPhotograph.self, from: data)
                    decodables.append(decodable)
                }
            }
            
            return decodables
        } catch {
            print(error)
        }
        
        return nil
    }
}
