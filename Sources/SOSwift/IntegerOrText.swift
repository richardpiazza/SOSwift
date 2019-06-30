import Foundation

public enum IntegerOrText: Codable, Equatable {
    case integer(value: Int)
    case text(value: String)
    
    public init(_ value: Int) {
        self = .integer(value: value)
    }
    
    public init(_ value: String) {
        self = .text(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let value = try container.decode(Int.self)
            self = .integer(value: value)
            return
        } catch {
            
        }
        
        let value = try container.decode(String.self)
        self = .text(value: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .integer(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var integer: Int? {
        switch self {
        case .integer(let value):
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
