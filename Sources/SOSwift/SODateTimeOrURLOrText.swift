import Foundation
import SOSwiftVocabulary

public enum SODateTimeOrURLOrText: DateTimeOrURLOrText, Codable {
    case dateTime(value: DateTime)
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
        
        do {
            let value = try container.decodeDateTime()
            self = .dateTime(value: value)
            return
        } catch {
            
        }
        
        let value = try container.decode(String.self)
        self = .text(value: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .dateTime(let value):
            try container.encodeDateTime(value)
        case .url(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: DateTimeOrURLOrText?, forKey key: K) throws {
        if let typedValue = value as? DateTime {
            try self.encodeIfPresent(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [DateTimeOrURLOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SODateTimeOrURLOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? DateTime {
                try container.encodeDateTime(typedValue)
            } else if let typedValue = object as? URL {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeDateTimeOrURLOrTextIfPresent(forKey key: K) throws -> DateTimeOrURLOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeDateTimeIfPresent(forKey: key) {
                return value
            }
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `DateTimeOrTextOrURL` for key: \(key.stringValue).")
        
        return nil
    }
    
    func decodeDateTimesOrURLsOrTextsIfPresent(forKey key: K) throws -> [DateTimeOrURLOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SODateTimeOrURLOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
