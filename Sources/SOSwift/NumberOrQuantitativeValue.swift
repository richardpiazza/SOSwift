import Foundation

public enum NumberOrQuantitativeValue: Codable {
    case number(value: Number)
    case quantitativeValue(value: QuantitativeValue)
    
    public init(_ value: Number) {
        self = .number(value: value)
    }
    
    public init(_ value: QuantitativeValue) {
        self = .quantitativeValue(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(Number.self)
            self = .number(value: value)
            return
        }
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case QuantitativeValue.schemaName:
            let value = try container.decode(QuantitativeValue.self)
            self = .quantitativeValue(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .number(let value):
            try container.encode(value)
        case .quantitativeValue(let value):
            try container.encode(value)
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
    
    public var quantitativeValue: QuantitativeValue? {
        switch self {
        case .quantitativeValue(let value):
            return value
        default:
            return nil
        }
    }
}
