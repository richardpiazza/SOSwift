import Foundation

public typealias ValueReference = EnumerationOrPropertyValueOrQualitativeValueOrQuantitativeValueOrStructuredValue

public enum EnumerationOrPropertyValueOrQualitativeValueOrQuantitativeValueOrStructuredValue: Codable {
    case enumeration(value: Enumeration)
    case propertyValue(value: PropertyValue)
    case qualitativeValue(value: QualitativeValue)
    case quantitativeValue(value: QuantitativeValue)
    case structuredValue(value: StructuredValue)
    
    public init(_ value: Enumeration) {
        self = .enumeration(value: value)
    }
    
    public init(_ value: PropertyValue) {
        self = .propertyValue(value: value)
    }
    
    public init(_ value: QualitativeValue) {
        self = .qualitativeValue(value: value)
    }
    
    public init(_ value: QuantitativeValue) {
        self = .quantitativeValue(value: value)
    }
    
    public init(_ value: StructuredValue) {
        self = .structuredValue(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Enumeration.schemaType:
            let value = try container.decode(Enumeration.self)
            self = .enumeration(value: value)
        case PropertyValue.schemaType:
            let value = try container.decode(PropertyValue.self)
            self = .propertyValue(value: value)
        case QualitativeValue.schemaType:
            let value = try container.decode(QualitativeValue.self)
            self = .qualitativeValue(value: value)
        case QuantitativeValue.schemaType:
            let value = try container.decode(QuantitativeValue.self)
            self = .quantitativeValue(value: value)
        case StructuredValue.schemaType:
            let value = try container.decode(StructuredValue.self)
            self = .structuredValue(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .enumeration(let value):
            try container.encode(value)
        case .propertyValue(let value):
            try container.encode(value)
        case .qualitativeValue(let value):
            try container.encode(value)
        case .quantitativeValue(let value):
            try container.encode(value)
        case .structuredValue(let value):
            try container.encode(value)
        }
    }
    
    public var enumeration: Enumeration? {
        switch self {
        case .enumeration(let value):
            return value
        default:
            return nil
        }
    }
    
    public var propertyValue: PropertyValue? {
        switch self {
        case .propertyValue(let value):
            return value
        default:
            return nil
        }
    }
    
    public var qualitativeValue: QualitativeValue? {
        switch self {
        case .qualitativeValue(let value):
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
    
    public var structuredValue: StructuredValue? {
        switch self {
        case .structuredValue(let value):
            return value
        default:
            return nil
        }
    }
}
