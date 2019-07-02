import Foundation

/// The most generic type of item/entity.
public class Thing: Schema, Codable {
    
    /// An additional type for the item, typically used for adding more specific types from external vocabularies in
    /// microdata syntax.
    ///
    /// This is a relationship between something and a class that the thing is in. In RDFa syntax, it is better to use
    /// the native RDFa syntax - the 'typeof' attribute - for multiple types. Schema.org tools may have only weaker
    /// understanding of extra types, in particular those defined externally.
    public var additionalType: URL?
    
    /// An alias for the item.
    public var alternativeName: String?
    
    /// A description of the item.
    public var description: String?
    
    /// A sub property of description.
    ///
    /// A short description of the item used to disambiguate from other, similar items. Information from other
    /// properties (in particular, name) may be necessary for the description to be useful for disambiguation.
    public var disambiguatingDescription: String?
    
    /// The identifier property represents any kind of identifier for any kind of Thing, such as ISBNs, GTIN codes,
    /// UUIDs etc.
    ///
    /// Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL
    /// (URI) links.
    public var identifier: Identifier?
    
    /// An image of the item. This can be a URL or a fully described ImageObject.
    public var image: ImageObjectOrURL?
    
    /// Indicates a page (or other CreativeWork) for which this thing is the main entity being described.
    ///
    /// ## Inverse Property
    /// _mainEntity_
    public var mainEntityOfPage: CreativeWorkOrURL?
    
    /// The name of the item.
    public var name: String?
    
    /// Indicates a potential Action, which describes an idealized action in which this thing would play an 'object'
    /// role.
    public var potentialAction: Action?
    
    /// URL of a reference Web page that unambiguously indicates the item's identity.
    ///
    /// ## Example
    /// The URL of the item's Wikipedia page, Wikidata entry, or official website.
    public var sameAs: [URL]?
    
    /// A CreativeWork or Event about this Thing.
    ///
    /// ## Inverse Property
    /// _about_
    public var subjectOf: CreativeWorkOrEvent?
    
    /// URL of the item.
    public var url: URL?
    
    internal enum ThingCodingKeys: String, CodingKey {
        case additionalType
        case alternativeName
        case description
        case disambiguatingDescription
        case identifier
        case image
        case mainEntityOfPage
        case name
        case potentialAction
        case sameAs
        case subjectOf
        case url
    }
    
    public init() {
        
    }
    
    public convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    public required init(from decoder: Decoder) throws {
        let schema = try decoder.container(keyedBy: SchemaKeys.self)
        let container = try decoder.container(keyedBy: ThingCodingKeys.self)
        
        let id = try schema.decodeIfPresent(Identifier.self, forKey: .id)
        let identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        
        switch (id, identifier) {
        case (.some(let id), .none):
            self.identifier = id
        case (.some, .some(let identifier)), (.none, .some(let identifier)):
            self.identifier = identifier
        case (.none, .none):
            break
        }
        
        additionalType = try container.decodeIfPresent(URL.self, forKey: .additionalType)
        alternativeName = try container.decodeIfPresent(String.self, forKey: .alternativeName)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        disambiguatingDescription = try container.decodeIfPresent(String.self, forKey: .disambiguatingDescription)
        image = try container.decodeIfPresent(ImageObjectOrURL.self, forKey: .image)
        mainEntityOfPage = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .mainEntityOfPage)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        potentialAction = try container.decodeIfPresent(Action.self, forKey: .potentialAction)
        sameAs = try container.decodeIfPresent([URL].self, forKey: .sameAs)
        subjectOf = try container.decodeIfPresent(CreativeWorkOrEvent.self, forKey: .subjectOf)
        url = try container.decodeIfPresent(URL.self, forKey: .url)
    }
    
    public func encode(to encoder: Encoder) throws {
        var schema = encoder.container(keyedBy: SchemaKeys.self)
        
        try schema.encode(Swift.type(of: self).schemaContext, forKey: .context)
        try schema.encode(Swift.type(of: self).schemaType, forKey: .type)
        try schema.encodeIfPresent(identifier, forKey: .id)
        
        var container = encoder.container(keyedBy: ThingCodingKeys.self)
        
        try container.encodeIfPresent(identifier, forKey: .identifier)
        try container.encodeIfPresent(additionalType, forKey: .additionalType)
        try container.encodeIfPresent(alternativeName, forKey: .alternativeName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(disambiguatingDescription, forKey: .disambiguatingDescription)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(mainEntityOfPage, forKey: .mainEntityOfPage)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(potentialAction, forKey: .potentialAction)
        try container.encodeIfPresent(sameAs, forKey: .sameAs)
        try container.encodeIfPresent(subjectOf, forKey: .subjectOf)
        try container.encodeIfPresent(url, forKey: .url)
    }
}
