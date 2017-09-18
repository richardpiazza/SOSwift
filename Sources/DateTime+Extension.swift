import Foundation
import SOSwiftVocabulary

fileprivate struct DateTimeFormatter {
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
        
        return DateTimeFormatter.iso8601.date(from: value)
    }
}
