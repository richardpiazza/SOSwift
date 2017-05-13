import Foundation

public protocol SchemaNumber: SchemaBooleanOrNumberOrStructuredValueOrText, SchemaNumberOrText {
}

extension Int: SchemaNumber {
}

extension Float: SchemaNumber {
}
