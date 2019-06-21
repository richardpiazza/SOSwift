import Foundation
import SOSwiftVocabulary

/// The most generic type of item.
public class SOThing: Thing, Dynamic {
    
    public class var type: String {
        return "Thing"
    }
    
    public class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOAction.self,
            SOAudience.self,
            SOCreativeWork.self,
            SOEvent.self,
            SOGeoShape.self,
            SOIntangible.self,
            SOMonetaryAmount.self,
            SOOrganization.self,
            SOPerson.self,
            SOPlace.self,
            SOProduct.self,
            SOWarrantyPromise.self
        ]
    }
    
    public struct Keywords {
        public static let id = "@id"
        public static let context = "@context"
        public static let type = "@type"
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
    /// A CreativeWork or Event about this Thing.
    /// - Inverse property: about
    public var subjectOf: CreativeWorkOrEvent?
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
        case subjectOf
        case url
    }
    
    public init() {
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.additionalType = try container.decodeIfPresent(URL.self, forKey: .additionalType)
        self.alternativeName = try container.decodeIfPresent(String.self, forKey: .alternativeName)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.disambiguatingDescription = try container.decodeIfPresent(String.self, forKey: .disambiguatingDescription)
        if let value = try container.decodeIdentifierIfPresent(forKey: .identifier) {
            self.identifier = value
        } else if let value = try container.decodeIdentifierIfPresent(forKey: .id) {
            self.identifier = value
        }
        self.image = try container.decodeImageObjectOrURLIfPresent(forKey: .image)
        self.mainEntityOfPage = try container.decodeCreativeWorkOrURLIfPresent(forKey: .mainEntityOfPage)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.potentialAction = try container.decodeIfPresent(SOAction.self, forKey: .potentialAction)
        self.sameAs = try container.decodeIfPresent([URL].self, forKey: .sameAs)
        self.subjectOf = try container.decodeCreativeWorkOrEventIfPresent(forKey: .subjectOf)
        self.url = try container.decodeIfPresent(URL.self, forKey: .url)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(Swift.type(of: self).context, forKey: .context)
        try container.encode(Swift.type(of: self).type, forKey: .type)
        
        try container.encodeIfPresent(self.additionalType, forKey: .additionalType)
        try container.encodeIfPresent(self.alternativeName, forKey: .alternativeName)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.disambiguatingDescription, forKey: .disambiguatingDescription)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.mainEntityOfPage, forKey: .mainEntityOfPage)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.potentialAction, forKey: .potentialAction)
        try container.encodeIfPresent(self.sameAs, forKey: .sameAs)
        try container.encodeIfPresent(self.subjectOf, forKey: .subjectOf)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
    
    // MARK: - Attributed
    public func displayName(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        default:
            return attributeName.spaceSeparatedWords.capitalized
        }
    }
    
    public func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.additionalType.rawValue:
            return "An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax."
        case CodingKeys.alternativeName.rawValue:
            return "An alias for the item."
        case CodingKeys.description.rawValue:
            return "A description of the item."
        case CodingKeys.disambiguatingDescription.rawValue:
            return "A short description of the item used to disambiguate from other, similar items."
        case CodingKeys.identifier.rawValue:
            return "Represents any kind of identifier for any kind of Thing, such as ISBNs, GTIN codes, UUIDs etc."
        case CodingKeys.image.rawValue:
            return "An image of the item."
        case CodingKeys.mainEntityOfPage.rawValue:
            return "Indicates a page (or other CreativeWork) for which this thing is the main entity being described."
        case CodingKeys.name.rawValue:
            return "The name of the item."
        case CodingKeys.potentialAction.rawValue:
            return "Indicates a potential Action, which describes an idealized action in which this thing would play an 'object' role."
        case CodingKeys.sameAs.rawValue:
            return "Reference Webpages that unambiguously indicates the item's identity."
        case CodingKeys.subjectOf.rawValue:
            return "A CreativeWork or Event about this Thing."
        case CodingKeys.url.rawValue:
            return "URL of the item."
        default:
            return nil
        }
    }
    
    public func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.additionalType.rawValue:
            self.additionalType = value as? URL
        case CodingKeys.alternativeName.rawValue:
            self.alternativeName = value as? String
        case CodingKeys.description.rawValue:
            self.description = value as? String
        case CodingKeys.disambiguatingDescription.rawValue:
            self.disambiguatingDescription = value as? String
        case CodingKeys.identifier.rawValue:
            self.identifier = value as? Identifier
        case CodingKeys.image.rawValue:
            self.image = value as? ImageObjectOrURL
        case CodingKeys.mainEntityOfPage.rawValue:
            self.mainEntityOfPage = value as? CreativeWorkOrURL
        case CodingKeys.name.rawValue:
            self.name = value as? String
        case CodingKeys.potentialAction.rawValue:
            self.potentialAction = value as? Action
        case CodingKeys.sameAs.rawValue:
            self.sameAs = value as? [URL]
        case CodingKeys.subjectOf.rawValue:
            self.subjectOf = value as? CreativeWorkOrEvent
        case CodingKeys.url.rawValue:
            self.url = value as? URL
        default:
            break
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: Thing?, forKey key: K) throws {
        if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        }
    }
}
