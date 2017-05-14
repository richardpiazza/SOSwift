import Foundation

fileprivate struct DateTimeFormatter {
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter
    }
}

public protocol DateTimeConformance:
                    DateOnlyOrDateTime,
                    DateTimeOrTextOrURL
                {}

/// A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (see Chapter 5.4 of ISO 8601).
public protocol DateTime: DateTimeConformance {}

public extension DateTime {
    var dateTime: Date? {
        guard let value = self as? String else {
            return nil
        }
        
        return DateTimeFormatter.iso8601.date(from: value)
    }
}

extension String: DateTime {}
