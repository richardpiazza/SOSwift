import Foundation
import SOSwiftVocabulary

public enum SOURLOrText: URLOrText, Codable {
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

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: URLOrText?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOURLOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [URLOrText]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOURLOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value.forEach({ (object) in
            if let typedValue = object as? URL {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeURLOrTextIfPresent(forKey key: K) throws -> URLOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOURLOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeURLsOrTextsIfPresent(forKey key: K) throws -> [URLOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOURLOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
