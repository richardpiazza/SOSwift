import Foundation

public struct DateTime: RawRepresentable, Codable {
    public typealias RawValue = String
    
    public var rawValue: String
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(date: Date) {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            rawValue = iso8601.string(from: date)
        } else {
            rawValue = iso8601Simple.string(from: date)
        }
    }
    
    public var date: Date? {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return iso8601.date(from: rawValue)
        } else {
            return iso8601Simple.date(from: rawValue)
        }
    }
}

@available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
fileprivate var iso8601: ISO8601DateFormatter {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    return formatter
}

fileprivate var iso8601Simple: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"
    return formatter
}
