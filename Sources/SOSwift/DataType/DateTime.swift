import Foundation

public struct DateTime: RawRepresentable, Equatable, Codable {
    
    public typealias RawValue = Date
    
    /// A default `DateFormatter` for interacting with Schema.org date-time formats.
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    public static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }
    
    /// A fallback `DateFormatter` using the format `yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ`
    public static var iso8601Simple: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"
        return formatter
    }
    
    public static func makeDate(from stringValue: String) throws -> Date {
        let _date: Date?
        
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            _date = iso8601.date(from: stringValue)
        } else {
            _date = iso8601Simple.date(from: stringValue)
        }
        
        guard let date = _date else {
            throw SchemaError.incorrectDateFormat
        }
        
        return date
    }
    
    public static func makeString(from date: Date) -> String {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return iso8601.string(from: date)
        } else {
            return iso8601Simple.string(from: date)
        }

    }
    
    public var rawValue: Date
    
    public init(rawValue: Date) {
        self.rawValue = rawValue
    }
    
    public init?(stringValue: String) {
        let date: Date
        do {
            date = try type(of: self).makeDate(from: stringValue)
        } catch {
            return nil
        }
        
        rawValue = date
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        rawValue = try type(of: self).makeDate(from: value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(stringValue)
    }
    
    public var stringValue: String {
        return type(of: self).makeString(from: rawValue)
    }
}


