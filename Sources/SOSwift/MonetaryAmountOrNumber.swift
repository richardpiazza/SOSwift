import Foundation

public enum MonetaryAmountOrNumber: Codable {
    case monetaryAmount(value: MonetaryAmount)
    case number(value: Number)
    
    public init(_ value: MonetaryAmount) {
        self = .monetaryAmount(value: value)
    }
    
    public init(_ value: Number) {
        self = .number(value: value)
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
        case MonetaryAmount.schemaName:
            let value = try container.decode(MonetaryAmount.self)
            self = .monetaryAmount(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .monetaryAmount(let value):
            try container.encode(value)
        case .number(let value):
            try container.encode(value)
        }
    }
    
    public var monetaryAmount: MonetaryAmount? {
        switch self {
        case .monetaryAmount(let value):
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
}
