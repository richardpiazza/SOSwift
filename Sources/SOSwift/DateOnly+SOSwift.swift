import Foundation
import SOSwiftVocabulary

fileprivate struct DateOnlyFormatter {
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withDashSeparatorInDate, .withYear, .withMonth, .withDay]
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static var iso8601Local: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withDashSeparatorInDate, .withYear, .withMonth, .withDay]
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    static var iso8601SimpleLocal: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone.current
        return formatter
    }
}

public extension DateOnly {
    var date: Date? {
        guard let value = self as? String else {
            return nil
        }
        
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return DateOnlyFormatter.iso8601Local.date(from: value)
        } else {
            return DateOnlyFormatter.iso8601SimpleLocal.date(from: value)
        }
    }
}

public extension Date {
    var dateOnly: DateOnly {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return DateOnlyFormatter.iso8601.string(from: self)
        } else {
            return DateOnlyFormatter.iso8601Simple.string(from: self)
        }
    }
}

// MARK: - Encoding

fileprivate let encodingContext = EncodingError.Context(codingPath: [], debugDescription: "Failed to encode DateOnly")

public extension KeyedEncodingContainer {
    mutating func encode(_ value: DateOnly, forKey key: K) throws {
        guard let typedValue = value as? String else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        try self.encode(typedValue, forKey: key)
    }
    
    mutating func encodeIfPresent(_ value: DateOnly?, forKey key: K) throws {
        if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension SingleValueEncodingContainer {
    mutating func encodeDateOnly(_ value: DateOnly) throws {
        guard let date = value.date else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        guard let typedValue = date.dateOnly as? String else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        try self.encode(typedValue)
    }
}

public extension UnkeyedEncodingContainer {
    mutating func encodeDateOnly(_ value: DateOnly) throws {
        guard let date = value.date else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        guard let typedValue = date.dateOnly as? String else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        try self.encode(typedValue)
    }
}

// MARK: - Decoding

fileprivate let decodingContext = DecodingError.Context(codingPath: [], debugDescription: "Failed to decode DateOnly")

public extension KeyedDecodingContainer {
    func decodeDateOnlyIfPresent(forKey key: K) throws -> DateOnly? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key) as DateOnly
            if value.date != nil {
                return value
            }
        } catch {
        }
        
        print("Failed to decode `DateOnly` for key: \(key.stringValue).")
        
        return nil
    }
}

public extension SingleValueDecodingContainer {
    func decodeDateOnly() throws -> DateOnly {
        let value = try self.decode(String.self)
        guard let date = (value as DateOnly).date else {
            throw DecodingError.typeMismatch(DateOnly.self, decodingContext)
        }
        
        return date.dateOnly
    }
}
