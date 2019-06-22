import Foundation

public enum DateOnlyOrDateTime: Codable {
    case dateOnly(value: DateOnly)
    case dateTime(value: DateTime)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let value = try container.decode(String.self)
        
        if value.count > 10 || value.contains("T") || value.contains(":") {
            let dateTime = try container.decode(DateTime.self)
            self = .dateTime(value: dateTime)
        } else {
            let dateOnly = try container.decode(DateOnly.self)
            self = .dateOnly(value: dateOnly)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .dateOnly(let value):
            try container.encode(value)
        case .dateTime(let value):
            try container.encode(value)
        }
    }
    
    public var dateOnly: DateOnly? {
        switch self {
        case .dateOnly(let value):
            return value
        default:
            return nil
        }
    }
    
    public var dateTime: DateTime? {
        switch self {
        case .dateTime(let value):
            return value
        default:
            return nil
        }
    }
}
