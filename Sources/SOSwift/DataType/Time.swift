import Foundation

public struct Time: RawRepresentable, Equatable, Codable {

    public typealias RawValue = Date

    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    public static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withTime, .withTimeZone, .withColonSeparatorInTime, .withColonSeparatorInTimeZone]
        return formatter
    }

    public static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH':'mm':'ssZZZZZ"
        return formatter
    }

    public static func makeDate(from string: String) throws -> Date {
        let _date: Date? = if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            iso8601.date(from: string)
        } else {
            iso8601Simple.date(from: string)
        }

        guard let date = _date else {
            throw SchemaError.incorrectDateFormat
        }

        return date
    }

    public static func makeString(from date: Date) -> String {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            iso8601.string(from: date)
        } else {
            iso8601Simple.string(from: date)
        }
    }

    public var rawValue: Date

    public init(rawValue: Date) {
        self.rawValue = rawValue
    }

    public init?(stringValue: String) {
        let date: Date
        do {
            date = try Self.makeDate(from: stringValue)
        } catch {
            return nil
        }

        rawValue = date
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        rawValue = try Self.makeDate(from: value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(stringValue)
    }

    var stringValue: String {
        Self.makeString(from: rawValue)
    }
}

public extension Time {
    var dateComponents: DateComponents {
        Calendar.current.dateComponents(in: TimeZone(secondsFromGMT: 0)!, from: rawValue)
    }

    var hour: Int? {
        dateComponents.hour
    }

    var minute: Int? {
        dateComponents.minute
    }

    var second: Int? {
        dateComponents.second
    }
}
