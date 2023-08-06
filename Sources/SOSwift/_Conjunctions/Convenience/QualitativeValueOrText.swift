import CodablePlus

public enum QualitativeValueOrText: Codable {
    case qualitativeValue(QualitativeValue)
    case text(String)
    
    public init(_ value: QualitativeValue) {
        self = .qualitativeValue(value)
    }
    
    public init(_ value: String) {
        self = .text(value)
    }
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
        }
        
        guard let jsonDictionary = dictionary else {
            self = .text(try decoder.stringContents())
            return
        }
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case QualitativeValue.schemaName:
            let value = try container.decode(QualitativeValue.self)
            self = .qualitativeValue(value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .qualitativeValue(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var qualitativeValue: QualitativeValue? {
        guard case .qualitativeValue(let value) = self else {
            return nil
        }
        
        return value
    }
    
    public var text: String? {
        guard case .text(let value) = self else {
            return nil
        }
        
        return value
    }
}
