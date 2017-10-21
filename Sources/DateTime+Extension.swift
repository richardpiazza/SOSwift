import Foundation
import SOSwiftVocabulary

fileprivate struct DateTimeFormatter {
    static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"
        return formatter
    }
    
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate, .withColonSeparatorInTime, .withColonSeparatorInTimeZone]
        return formatter
    }
}

public extension DateTime {
    var dateTime: Date? {
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

// MARK: - DateTime

public extension KeyedEncodingContainer {
    public mutating func encodeDateTime(_ value: DateTime, forKey key: K) throws {
        if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDateTimeIfPresent(forKey key: K) throws -> DateTime? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
