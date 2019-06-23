import Foundation

public enum URLOrText: Codable {
    case url(value: URL)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let value = try container.decode(URL.self)
            if value.isValid {
                self = .url(value: value)
                return
            }
        } catch {
            
        }
        
        let value = try container.decode(String.self)
        self = .text(value: value)
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
