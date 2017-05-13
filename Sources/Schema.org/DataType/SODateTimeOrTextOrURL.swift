import Foundation

public protocol SchemaDateTimeOrTextOrURL {
}

extension String: SchemaDateTimeOrTextOrURL {
}

extension URL: SchemaDateTimeOrTextOrURL {
}
