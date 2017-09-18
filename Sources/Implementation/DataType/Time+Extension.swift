import Foundation

fileprivate struct TimeFormatter {
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
        
        return TimeFormatter.iso8601.date(from: value)
    }
}
