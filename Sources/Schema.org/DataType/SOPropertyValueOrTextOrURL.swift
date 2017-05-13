import Foundation

public protocol SchemaPropertyValueOrTextOrURL {
    
}

extension String: SchemaPropertyValueOrTextOrURL {
}

extension URL: SchemaPropertyValueOrTextOrURL {
}
