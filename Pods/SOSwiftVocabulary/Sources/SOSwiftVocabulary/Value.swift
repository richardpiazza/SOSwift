import Foundation

/// Boolean, Number, StructuredValue, Text
public protocol Value {}

extension Bool: Value {}

extension String: Value {}
