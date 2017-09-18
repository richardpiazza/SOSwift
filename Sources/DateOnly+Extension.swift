import Foundation
import SOSwiftVocabulary

fileprivate struct DateOnlyFormatter {
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withDashSeparatorInDate, .withYear, .withMonth, .withDay]
        return formatter
    }
}

public extension DateOnly {
    var dateOnly: Date? {
        guard let value = self as? String else {
            return nil
        }
        
        return DateOnlyFormatter.iso8601.date(from: value)
    }
}
