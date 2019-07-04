import Foundation

public enum ItemListOrderOrText: Codable {
    case itemListOrder(value: ItemListOrder)
    case text(value: String)
    
    public init(_ value: ItemListOrder) {
        self = .itemListOrder(value: value)
    }
    
    public init(_ value: String) {
        self = .text(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let value = try container.decode(String.self)
        
        if let itemListOrder = ItemListOrder(rawValue: value) {
            self = .itemListOrder(value: itemListOrder)
        } else {
            self = .text(value: value)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .itemListOrder(let value):
            try container.encode(value.rawValue)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var itemListOrder: ItemListOrder? {
        switch self {
        case .itemListOrder(let value):
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
