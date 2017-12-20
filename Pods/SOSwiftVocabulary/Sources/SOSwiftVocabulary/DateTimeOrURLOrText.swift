import Foundation

/// DateTime, Text, URL
public protocol DateTimeOrURLOrText {}

extension String: DateTimeOrURLOrText {}

extension URL: DateTimeOrURLOrText {}
