import Foundation

public class Schema: Codable {
    
    public static var typeDecodingError: DecodingError {
        let context = DecodingError.Context(codingPath: [CodingKeys.type], debugDescription: "No key found for schema '@type'.")
        return DecodingError.keyNotFound(CodingKeys.type, context)
    }
    
    open class var schemaContext: String {
        return "http://www.schema.org"
    }
    
    open class var schemaType: String {
        return String(describing: self)
    }
    
    /// The identifier property represents any kind of identifier for any kind
    /// of Thing, such as ISBNs, GTIN codes, UUIDs etc. Schema.org provides
    /// dedicated properties for representing many of these, either as textual
    /// strings or as URL (URI) links.
    public var identifier: Identifier?
    
    public enum CodingKeys: String, CodingKey {
        case id = "@id"
        case context = "@context"
        case type = "@type"
        case identifier
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id = try container.decodeIfPresent(Identifier.self, forKey: .id)
        let identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        
        switch (id, identifier) {
        case (.some(let id), .none):
            self.identifier = id
        case (.some, .some(let identifier)), (.none, .some(let identifier)):
            self.identifier = identifier
        case (.none, .none):
            break
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(Swift.type(of: self).schemaContext, forKey: .context)
        try container.encode(Swift.type(of: self).schemaType, forKey: .type)
        try container.encodeIfPresent(identifier, forKey: .id)
        try container.encodeIfPresent(identifier, forKey: .identifier)
    }
}
