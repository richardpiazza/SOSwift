import Foundation

public protocol SchemaProductOrTextOrURL {
    
}

extension String: SchemaProductOrTextOrURL {
}

extension URL: SchemaProductOrTextOrURL {
}
