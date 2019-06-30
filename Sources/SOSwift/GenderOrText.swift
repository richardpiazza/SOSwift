import Foundation

public enum GenderOrText: Codable, Equatable {
    case gender(value: Gender)
    case text(value: String)
    
    public init(_ value: Gender) {
        self = .gender(value: value)
    }
    
    public init(_ value: String) {
        self = .text(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        
        if let gender = Gender(rawValue: value) {
            self = .gender(value: gender)
        } else {
            self = .text(value: value)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .gender(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var gender: Gender? {
        switch self {
        case .gender(let value):
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
