import Foundation
import SOSwiftVocabulary

fileprivate struct DateOnlyFormatter {
    static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
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
        
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return DateOnlyFormatter.iso8601.date(from: value)
        } else {
            return DateOnlyFormatter.iso8601Simple.date(from: value)
        }
    }
}
