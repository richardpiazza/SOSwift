import Foundation
import SOSwiftVocabulary

// MARK: - ProductOrService

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: ProductOrService?, forKey key: K) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOService {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ values: [ProductOrService]?, forKey key: K) throws {
        guard let values = values else {
            return
        }
        
        var subcontainer = self.nestedUnkeyedContainer(forKey: key)
        
        for value in values {
            if let typedValue = value as? SOProduct {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? SOService {
                try subcontainer.encode(typedValue)
            }
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeProductOrServiceIfPresent(forKey key: K) throws -> ProductOrService? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOProduct.type {
                return try self.decode(SOProduct.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOService.type {
                return try self.decode(SOService.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `ProductOrService` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeProductsOrServicesIfPresent(forKey key: K) throws -> [ProductOrService]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [ProductOrService]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                    if dictionary[SOThing.Keywords.type] as? String == SOProduct.type {
                        let decodable = try JSONDecoder().decode(SOProduct.self, from: data)
                        decodables.append(decodable)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOService.type {
                        let decodable = try JSONDecoder().decode(SOService.self, from: data)
                        decodables.append(decodable)
                    }
                }
            }
            
            return decodables
        } catch {
        }
        
        print("Failed to decode `[ProductOrService]` for key: \(key.stringValue).")
        
        return nil
    }
}
