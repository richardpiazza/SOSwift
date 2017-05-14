import Foundation

fileprivate struct TimeFormatter {
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withTime, .withTimeZone]
        return formatter
    }
}

/// A point in time recurring on multiple days in the form hh:mm:ss[Z|(+|-)hh:mm]
public protocol Time {}

public extension Time {
    var time: Date? {
        guard let value = self as? String else {
            return nil
        }
        
        return TimeFormatter.iso8601.date(from: value)
    }
}

extension String: Time {}
