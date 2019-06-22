import Foundation
import SOSwiftVocabulary

public enum SOProductOrService: ProductOrService, Codable {
    case product(value: SOProduct)
    case service(value: SOService)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOProduct.type:
            let value = try container.decode(SOProduct.self)
            self = .product(value: value)
        case SOService.type:
            let value = try container.decode(SOService.self)
            self = .service(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .product(let value):
            try container.encode(value)
        case .service(let value):
            try container.encode(value)
        }
    }
    
    public var product: SOProduct? {
        switch self {
        case .product(let value):
            return value
        default:
            return nil
        }
    }
    
    public var service: SOService? {
        switch self {
        case .service(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ProductOrService?, forKey key: K) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOService {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ values: [ProductOrService]?, forKey key: K) throws {
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

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeProductOrServiceIfPresent(forKey key: K) throws -> ProductOrService? {
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
    
    func decodeProductsOrServicesIfPresent(forKey key: K) throws -> [ProductOrService]? {
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
        
        do {
            if let element = try self.decodeProductOrServiceIfPresent(forKey: key) {
                return [element]
            }
        } catch {
        }
        
        print("Failed to decode `[ProductOrService]` for key: \(key.stringValue).")
        
        return nil
    }
}
