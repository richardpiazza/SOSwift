import Foundation
import SOSwiftVocabulary

public enum SOIntegerOrText: IntegerOrText, Codable {
    case integer(value: Int)
    case text(value: String)
    
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

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: IntegerOrText?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOIntegerOrText {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [IntegerOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOIntegerOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? Int {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeIntegerOrTextIfPresent(forKey key: K) throws -> IntegerOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOIntegerOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeIntegersOrTextsIfPresent(forKey key: K) throws -> [IntegerOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOIntegerOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
