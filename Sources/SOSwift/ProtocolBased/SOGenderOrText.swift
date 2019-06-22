import Foundation
import SOSwiftVocabulary

public enum SOGenderOrText: GenderOrText, Codable {
    case gender(value: Gender)
    case text(value: String)
    
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
            try container.encode(value.rawValue)
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

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: GenderOrText?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOGenderOrText {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? Gender {
            try self.encode(typedValue.rawValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [GenderOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOGenderOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? Gender {
                try container.encode(typedValue.rawValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeGenderOrTextIfPresent(forKey key: K) throws -> GenderOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOGenderOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeGendersOrTextsIfPresent(forKey key: K) throws -> [GenderOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOGenderOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
