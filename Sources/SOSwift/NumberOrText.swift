import Foundation

public enum NumberOrText: Codable, Equatable {
    case number(value: Number)
    case text(value: String)
    
    public init(_ value: Number) {
        self = .number(value: value)
    }
    
    public init(_ value: String) {
        self = .text(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let value = try container.decode(Number.self)
            self = .number(value: value)
            return
        } catch {
            
        }
        
        let value = try container.decode(String.self)
        self = .text(value: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .number(let value):
            try container.encode(value)
        case .text(let value):
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
    
    public var text: String? {
        switch self {
        case .text(let value):
            return value
        default:
            return nil
        }
    }
}
