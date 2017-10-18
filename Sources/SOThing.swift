import Foundation
import SOSwiftVocabulary

/// The most generic type of item.
public class SOThing: Thing, Codable {
    
    public class var type: String {
        return "Thing"
    }
    
    /// An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax.
    /// This is a relationship between something and a class that the thing is in.
    /// In RDFa syntax, it is better to use the native RDFa syntax - the 'typeof' attribute - for multiple types.
    /// Schema.org tools may have only weaker understanding of extra types, in particular those defined externally.
    public var additionalType: URL?
    /// An alias for the item.
    public var alternativeName: String?
    /// A description of the item.
    public var description: String?
    /// A sub property of description. A short description of the item used to disambiguate from other, similar items.
    /// Information from other properties (in particular, name) may be necessary for the description to be useful for disambiguation.
    public var disambiguatingDescription: String?
    /// The identifier property represents any kind of identifier for any kind of Thing, such as ISBNs, GTIN codes, UUIDs etc.
    /// Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL (URI) links.
    public var identifier: Identifier?
    /// An image of the item. This can be a URL or a fully described ImageObject.
    public var image: ImageObjectOrURL?
    /// Indicates a page (or other CreativeWork) for which this thing is the main entity being described. Inverse property: mainEntity
    public var mainEntityOfPage: CreativeWorkOrURL?
    /// The name of the item.
    public var name: String?
    /// Indicates a potential Action, which describes an idealized action in which this thing would play an 'object' role.
    public var potentialAction: Action?
    /// URL of a reference Web page that unambiguously indicates the item's identity. E.g. the URL of the item's Wikipedia page, Wikidata entry, or official website.
    public var sameAs: [URL]?
    /// URL of the item.
    public var url: URL?
    
    private enum CodingKeys: String, CodingKey {
        case id = "@id"
        case context = "@context"
        case type = "@type"
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
        case url
    }
    
    public init() {
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(URL.self, forKey: .additionalType) {
            self.additionalType = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .alternativeName) {
            self.alternativeName = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .description) {
            self.description = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .disambiguatingDescription) {
            self.disambiguatingDescription = value
        }
        if let value = try container.decodeIdentifierIfPresent(forKey: .id) {
            self.identifier = value
        }
        if let value = try container.decodeIdentifierIfPresent(forKey: .identifier) {
            self.identifier = value
        }
        if let value = try container.decodeImageObjectOrURLIfPresent(forKey: .image) {
            self.image = value
        }
        if let value = try container.decodeCreativeWorkOrURLIfPresent(forKey: .mainEntityOfPage) {
            self.mainEntityOfPage = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .name) {
            self.name = value
        }
        if let value = try container.decodeIfPresent(SOAction.self, forKey: .potentialAction) {
            self.potentialAction = value
        }
        if let value = try container.decodeIfPresent([URL].self, forKey: .sameAs) {
            self.sameAs = value
        }
        if let value = try container.decodeIfPresent(URL.self, forKey: .url) {
            self.url = value
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(Swift.type(of: self).context, forKey: .context)
        try container.encode(Swift.type(of: self).type, forKey: .type)
        
        if let value = self.additionalType {
            try container.encode(value, forKey: .additionalType)
        }
        if let value = self.alternativeName {
            try container.encode(value, forKey: .alternativeName)
        }
        if let value = self.description {
            try container.encode(value, forKey: .description)
        }
        if let value = self.disambiguatingDescription {
            try container.encode(value, forKey: .disambiguatingDescription)
        }
        if let value = self.identifier {
            try container.encodeIdentifier(value, forKey: .id)
        }
        if let value = self.image {
            try container.encodeImageObjectOrURL(value, forKey: .image)
        }
        if let value = self.mainEntityOfPage {
            try container.encodeCreativeWorkOrURL(value, forKey: .mainEntityOfPage)
        }
        if let value = self.name {
            try container.encode(value, forKey: .name)
        }
        if let value = self.potentialAction as? SOAction {
            try container.encode(value, forKey: .potentialAction)
        }
        if let value = self.sameAs {
            try container.encode(value, forKey: .sameAs)
        }
        if let value = self.url {
            try container.encode(value, forKey: .url)
        }
    }
}
