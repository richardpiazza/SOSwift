import Foundation
import SOSwiftVocabulary

public enum SODateOnlyOrDateTime: DateOnlyOrDateTime, Codable {
    case dateOnly(value: SOSwiftVocabulary.DateOnly)
    case dateTime(value: SOSwiftVocabulary.DateTime)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let value = try container.decode(String.self)
        
        if value.count > 10 || value.contains("T") || value.contains(":") {
            let dateTime = try container.decodeDateTime()
            self = .dateTime(value: dateTime)
        } else {
            let dateOnly = try container.decodeDateOnly()
            self = .dateOnly(value: dateOnly)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .dateOnly(let value):
            try container.encodeDateOnly(value)
        case .dateTime(let value):
            try container.encodeDateTime(value)
        }
    }
    
    public var dateOnly: SOSwiftVocabulary.DateOnly? {
        switch self {
        case .dateOnly(let value):
            return value
        default:
            return nil
        }
    }
    
    public var dateTime: SOSwiftVocabulary.DateTime? {
        switch self {
        case .dateTime(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: DateOnlyOrDateTime?, forKey key: K) throws {
        if let typedValue = value as? SODateOnlyOrDateTime {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOSwiftVocabulary.DateTime {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOSwiftVocabulary.DateOnly {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [DateOnlyOrDateTime]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SODateOnlyOrDateTime] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOSwiftVocabulary.DateOnly {
                try container.encodeDateOnly(typedValue)
            } else if let typedValue = object as? SOSwiftVocabulary.DateTime {
                try container.encodeDateTime(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeDateOnlyOrDateTimeIfPresent(forKey key: K) throws -> DateOnlyOrDateTime? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeDateTimeIfPresent(forKey: key) {
                return value
            }
        } catch {
        }
        
        do {
            if let value = try self.decodeDateOnlyIfPresent(forKey: key) {
                return value
            }
        } catch {
        }
        
        print("Failed to decode `DateOnlyOrDateTime` for key \(key.stringValue).")
        
        return nil
    }
    
    func decodeDateOnlysOrDateTimesIfPresent(forKey key: K) throws -> [DateOnlyOrDateTime]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SODateOnlyOrDateTime].self, forKey: key)
        } catch {
            return nil
        }
    }
}
