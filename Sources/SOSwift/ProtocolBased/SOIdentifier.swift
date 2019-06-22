import Foundation
import SOSwiftVocabulary

public typealias PropertyValueOrURLOrText = SOIdentifier

public enum SOIdentifier: Identifier, Codable {
    case propertyValue(value: SOPropertyValue)
    case url(value: URL)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            do {
                let value = try container.decode(URL.self)
                self = .url(value: value)
                return
            } catch {
                
            }
            
            let value = try container.decode(String.self)
            self = .text(value: value)
            return
        }
        
        guard let type = jsonDictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOPropertyValue.type:
            let value = try container.decode(SOPropertyValue.self)
            self = .propertyValue(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .propertyValue(let value):
            try container.encode(value)
        case .url(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var propertyValue: SOPropertyValue? {
        switch self {
        case .propertyValue(let value):
            return value
        default:
            return nil
        }
    }
    
    public var url: URL? {
        switch self {
        case .url(let value):
            return value
        default:
            return nil
        }
    }
    
    public var text: String? {
        switch self {
        case .text(let value):
            return value
        default:
            return nil
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: Identifier?, forKey key: K) throws {
        if let typedValue = value as? SOPropertyValue {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeIdentifierIfPresent(forKey key: K) throws -> Identifier? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOPropertyValue.type {
                return try self.decode(SOPropertyValue.self, forKey: key)
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
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `Identifier` for key: \(key.stringValue).")
        
        return nil
    }
}
