import Foundation

public protocol SchemaTextOrURL {
    
}

extension String: SchemaTextOrURL {
}

extension URL: SchemaTextOrURL {
}
