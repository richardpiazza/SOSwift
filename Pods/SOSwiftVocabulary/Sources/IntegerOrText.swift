import Foundation

/// Integer (Int), Text
public protocol IntegerOrText {}

extension Int: IntegerOrText {}

extension String: IntegerOrText {}
