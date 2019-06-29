import Foundation

public enum Number: Equatable, Codable {
    case floatingPoint(value: Double)
    case integer(value: Int)
    
    public init(_ value: Double) {
        self = .floatingPoint(value: value)
    }
    
    public init(_ value: Int) {
        self = .integer(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let value = try container.decode(Int.self)
            self = .integer(value: value)
            return
        } catch {
            
        }
        
        let value = try container.decode(Double.self)
        self = .floatingPoint(value: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .floatingPoint(let value):
            try container.encode(value)
        case .integer(let value):
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
    
    public var floatingPoint: Double? {
        switch self {
        case .floatingPoint(let value):
            return value
        default:
            return nil
        }
    }
}
