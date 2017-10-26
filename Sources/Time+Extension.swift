import Foundation
import SOSwiftVocabulary

fileprivate struct TimeFormatter {
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withTime, .withTimeZone, .withColonSeparatorInTime, .withColonSeparatorInTimeZone]
        return formatter
    }
    
    static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH':'mm':'ssZZZZZ"
        return formatter
    }
}

public extension Time {
    var date: Date? {
        guard let value = self as? String else {
            return nil
        }
        
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return TimeFormatter.iso8601.date(from: value)
        } else {
            return TimeFormatter.iso8601Simple.date(from: value)
        }
    }
}

public extension Date {
    var time: Time {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return TimeFormatter.iso8601.string(from: self)
        } else {
            return TimeFormatter.iso8601Simple.string(from: self)
        }
    }
}

// MARK: - Time

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Time?, forKey key: K) throws {
        if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeTimeIfPresent(forKey key: K) throws -> Time? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key) as Time
            if value.date != nil {
                return value
            }
        } catch {
        }
        
        print("Failed to decode `Time` for key: \(key.stringValue).")
        
        return nil
    }
}
