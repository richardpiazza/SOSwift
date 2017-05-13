import Foundation

public protocol SchemaIntegerOrText {
}

extension Int: SchemaIntegerOrText {
}

extension String: SchemaIntegerOrText {
}
