import Foundation

/// PropertyValue, Text
public protocol PropertyValueOrText {}

extension String: PropertyValueOrText {}
