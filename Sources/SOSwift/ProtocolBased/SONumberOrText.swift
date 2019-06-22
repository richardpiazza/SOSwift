import Foundation
import SOSwiftVocabulary

public enum SONumberOrText: NumberOrText, Codable {
    case number(value: SOSwiftVocabulary.Number)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let value = try container.decodeNumber()
            self = .number(value: value)
            return
        } catch {
            
        }
        
        let value = try container.decode(String.self)
        self = .text(value: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .number(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var number: SOSwiftVocabulary.Number? {
        switch self {
        case .number(let value):
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
    mutating func encodeIfPresent(_ value: NumberOrText?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SONumberOrText {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? Number {
            try self.encodeIfPresent(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [NumberOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SONumberOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? Int {
                try container.encode(typedValue)
            } else if let typedValue = object as? Double {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeNumberOrTextIfPresent(forKey key: K) throws -> NumberOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SONumberOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeNumbersOrTextsIfPresent(forKey key: K) throws -> [NumberOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SONumberOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
