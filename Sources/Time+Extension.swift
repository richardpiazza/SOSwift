import Foundation
import SOSwiftVocabulary

fileprivate struct TimeFormatter {
    static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH':'mm':'ssZZZZZ"
        return formatter
    }
    
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withTime, .withTimeZone, .withColonSeparatorInTime, .withColonSeparatorInTimeZone]
        return formatter
    }
}

public extension Time {
    var time: Date? {
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