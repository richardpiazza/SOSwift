import Foundation
import SOSwiftVocabulary

fileprivate struct DateTimeFormatter {
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }
    
    static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"
        return formatter
    }
}

public extension SOSwiftVocabulary.DateTime {
    var date: Date? {
        guard let value = self as? String else {
            return nil
        }
        
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return DateTimeFormatter.iso8601.date(from: value)
        } else {
            return DateTimeFormatter.iso8601Simple.date(from: value)
        }
    }
}

public extension Date {
    var dateTime: SOSwiftVocabulary.DateTime {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return DateTimeFormatter.iso8601.string(from: self)
        } else {
            return DateTimeFormatter.iso8601Simple.string(from: self)
        }
    }
}

// MARK: - Encoding

fileprivate let encodingContext = EncodingError.Context(codingPath: [], debugDescription: "Failed to encode DateTime")

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: SOSwiftVocabulary.DateTime?, forKey key: K) throws {
        if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encode(_ value: SOSwiftVocabulary.DateTime, forKey key: K) throws {
        guard let typedValue = value as? String else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        try self.encode(typedValue, forKey: key)
    }
}

public extension SingleValueEncodingContainer {
    mutating func encodeDateTime(_ value: SOSwiftVocabulary.DateTime) throws {
        guard let date = value.date else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        guard let typedValue = date.dateTime as? String else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        try self.encode(typedValue)
    }
}

public extension UnkeyedEncodingContainer {
    mutating func encodeDateTime(_ value: SOSwiftVocabulary.DateTime) throws {
        guard let date = value.date else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        guard let typedValue = date.dateTime as? String else {
            throw EncodingError.invalidValue(value, encodingContext)
        }
        
        try self.encode(typedValue)
    }
}

// MARK: - Decoding

fileprivate let decodingContext = DecodingError.Context(codingPath: [], debugDescription: "Failed to decode DateTime")

public extension KeyedDecodingContainer {
    func decodeDateTimeIfPresent(forKey key: K) throws -> SOSwiftVocabulary.DateTime? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key) as SOSwiftVocabulary.DateTime
            if value.date != nil {
                return value
            }
        } catch {
        }
        
        print("Failed to decode `DateTime` for key \(key.stringValue).")
        
        return nil
    }
}

public extension SingleValueDecodingContainer {
    func decodeDateTime() throws -> SOSwiftVocabulary.DateTime {
        let value = try self.decode(String.self)
        guard let date = (value as SOSwiftVocabulary.DateTime).date else {
            throw DecodingError.typeMismatch(DateTime.self, decodingContext)
        }
        
        return date.dateTime
    }
}
