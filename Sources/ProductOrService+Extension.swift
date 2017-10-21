import Foundation
import SOSwiftVocabulary

// MARK: - ProductOrService

public extension KeyedEncodingContainer {
    public mutating func encodeProductOrService(_ value: ProductOrService, forKey key: K) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOService {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeProductsOrServices(_ values: [ProductOrService], forKey key: K) throws {
        var encodables = [Encodable]()
        
        for value in values {
            if let typedValue = value as? SOProduct {
                encodables.append(typedValue)
            } else if let typedValue = value as? SOService {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodeProductOrServiceIfPresent(forKey key: K) throws -> ProductOrService? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOProduct.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOProduct.self, from: data)
            } else if value["@type"] as? String == SOService.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOService.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func decodeProductsOrServicesIfPresent(forKey key: K) throws -> [ProductOrService]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [ProductOrService]()
        
        do {
            let values = try self.decode([[String : AnyObject]].self, forKey: key)
            for value in values {
                let data = try JSONEncoder().encode(value)
                
                if value["@type"] as? String == SOProduct.type {
                    let decodable = try JSONDecoder().decode(SOProduct.self, from: data)
                    decodables.append(decodable)
                } else if value["@type"] as? String == SOService.type {
                    let decodable = try JSONDecoder().decode(SOService.self, from: data)
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
