import Foundation

public enum Value: Codable {
    case structuredValue(value: StructuredValue)
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
                let value = try container.decode(Number.self)
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
        
        guard let type = jsonDictionary[Schema.CodingKeys.type.rawValue] as? String else {
            throw Schema.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case StructuredValue.schemaType:
            let value = try container.decode(StructuredValue.self)
            self = .structuredValue(value: value)
        default:
            throw Schema.typeDecodingError
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
    
    public var structuredValue: StructuredValue? {
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
