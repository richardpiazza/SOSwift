import Foundation

public enum URLOrText: Codable, Equatable {
    case url(value: URL)
    case text(value: String)
    
    public init(_ value: URL) {
        self = .url(value: value)
    }
    
    public init(_ value: String) {
        self = .text(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        
        if let url = URL(string: value), url.isValid {
            self = .url(value: url)
        } else {
            self = .text(value: value)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .url(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var url: URL? {
        switch self {
        case .url(let value):
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
