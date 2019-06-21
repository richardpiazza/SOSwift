import Foundation
import SOSwiftVocabulary

public enum SOValue: Value, Codable {
    case structuredValue(value: SOStructuredValue)
    case number(value: Number)
    case text(value: String)
    case bool(value: Bool)
    
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
                let value = try container.decodeNumber()
                self = .number(value: value)
                return
            } catch {
            }
            
            do {
                let value = try container.decode(Bool.self)
                self = .bool(value: value)
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
        case SOStructuredValue.type:
            let value = try container.decode(SOStructuredValue.self)
            self = .structuredValue(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .structuredValue(let value):
            try container.encode(value)
        case .number(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        }
    }
    
    public var structuredValue: SOStructuredValue? {
        switch self {
        case .structuredValue(let value):
            return value
        default:
            return nil
        }
    }
    
    public var number: Number? {
        switch self {
        case .number(let value):
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
    
    public var bool: Bool? {
        switch self {
        case .bool(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: Value?, forKey key: K) throws {
        if let typedValue = value as? SOStructuredValue {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Bool {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Double {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeValueIfPresent(forKey key: K) throws -> Value? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOStructuredValue.type {
                return try self.decode(SOStructuredValue.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(Bool.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Double.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `Value` for key: \(key.stringValue).")
        
        return nil
    }
}
