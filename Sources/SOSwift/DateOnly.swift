import Foundation

public struct DateOnly: Codable {
    
    private var _date: Date
    
    public init?(stringValue: String) {
        guard let d = makeDate(from: stringValue) else {
            return nil
        }
        
        _date = d
    }
    
    public init(date: Date) {
        _date = date
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        guard let d = makeDate(from: value) else {
            throw SchemaError.typeDecodingError
        }
        
        _date = d
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(stringValue)
    }
    
    public var date: Date {
        return _date
    }
    
    public var stringValue: String {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return iso8601.string(from: _date)
        } else {
            return iso8601Simple.string(from: _date)
        }
    }
}

fileprivate func makeDate(from stringValue: String) -> Date? {
    if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
        guard let date = iso8601.date(from: stringValue) else {
            return nil
        }
        
        return date
    } else {
        guard let date = iso8601Simple.date(from: stringValue) else {
            return nil
        }
        
        return date
    }
}

@available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
fileprivate var iso8601: ISO8601DateFormatter {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withDashSeparatorInDate, .withYear, .withMonth, .withDay]
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
}

fileprivate var iso8601Simple: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
}
