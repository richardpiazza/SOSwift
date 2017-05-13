import Foundation

public protocol SchemaDate: SchemaDateOrDateTime {
}

extension String: SchemaDate {
}
