import Foundation

public protocol Schema {
    static var schemaContext: String { get }
    static var schemaType: String { get }
}

public extension Schema {
    static var schemaContext: String {
        return "http://www.schema.org"
    }
    
    static var schemaType: String {
        return String(describing: self)
    }
}

public enum SchemaKeys: String, CodingKey {
    case id = "@id"
    case context = "@context"
    case type = "@type"
}

public enum SchemaErrors: Error {
    case typeDecodingError
}
