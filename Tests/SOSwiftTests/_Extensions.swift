import Foundation
@testable import SOSwift

extension Calendar {
    static var gregorian: Calendar {
        Calendar(identifier: .gregorian)
    }
}

extension TimeZone {
    static var gmt: TimeZone {
        TimeZone(secondsFromGMT: 0)!
    }
}

extension [String: Any] {
    subscript(codingKey: CodingKey) -> Value? {
        self[codingKey.stringValue]
    }
}
