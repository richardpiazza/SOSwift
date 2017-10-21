import Foundation
import SOSwiftVocabulary

// MARK: - ImageObjectOrPhotograph

public extension KeyedEncodingContainer {
    public mutating func encodeImageObjectOrPhotograph(_ value: ImageObjectOrPhotograph, forKey key: K) throws {
        if let typedValue = value as? SOImageObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPhotograph {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeImageObjectsOrPhotographs(_ values: [ImageObjectOrPhotograph], forKey key: K) throws {
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
    public func decodeImageObjectOrPhotographIfPresent(forKey key: K) throws -> ImageObjectOrPhotograph? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOImageObject.type {
                return try self.decode(SOImageObject.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPhotograph.type {
                return try self.decode(SOPhotograph.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `ImageObjectOrPhotograph` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeImageObjectsOrPhotographsIfPresent(forKey key: K) throws -> [ImageObjectOrPhotograph]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [ImageObjectOrPhotograph]()
        
        do {
            let array = try self.decode([Dictionary<String, Any>].self, forKey: key)
            for element in array {
                let data = try JSONSerialization.data(withJSONObject: element, options: JSONSerialization.WritingOptions())
                
                if element[SOThing.Keywords.type] as? String == SOImageObject.type {
                    let decodable = try JSONDecoder().decode(SOImageObject.self, from: data)
                    decodables.append(decodable)
                } else if element[SOThing.Keywords.type] as? String == SOPhotograph.type {
                    let decodable = try JSONDecoder().decode(SOPhotograph.self, from: data)
                    decodables.append(decodable)
                }
            }
            
            return decodables
        } catch {
        }
        
        print("Failed to decode `[ImageObjectOrPhotograph]` for key: \(key.stringValue).")
        
        return nil
    }
}
