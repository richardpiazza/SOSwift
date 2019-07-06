import Foundation
@testable import SOSwift

extension Calendar {
    static var gregorian: Calendar {
        return Calendar(identifier: .gregorian)
    }
}

extension TimeZone {
    static var gmt: TimeZone {
        return TimeZone(secondsFromGMT: 0)!
    }
}

extension Dictionary where Key == String, Value == Any {
    subscript(codingKey: CodingKey) -> Value? {
        return self[codingKey.stringValue]
    }
}
