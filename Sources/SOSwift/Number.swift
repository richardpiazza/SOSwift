import Foundation

public struct Number: RawRepresentable, Codable {
    
    public enum NumberRawValue: Codable {
        case floatingPoint(value: Double)
        case integer(value: Int)
        
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
    }
    
    public typealias RawValue = NumberRawValue
    
    public var rawValue: NumberRawValue
    
    public init?(rawValue: NumberRawValue) {
        self.rawValue = rawValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(NumberRawValue.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public var intValue: Int? {
        switch rawValue {
        case .integer(let value):
            return value
        default:
            return nil
        }
    }
    
    public var doubleValue: Double? {
        switch rawValue {
        case .floatingPoint(let value):
            return value
        default:
            return nil
        }
    }
}
