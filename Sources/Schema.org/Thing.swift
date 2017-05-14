import Foundation

public protocol ThingConformance:
                    ListItemOrTextOrThing,
                    TextOrThing
                {}

/// The most generic type of item.
public protocol Thing: ThingConformance {
    /// The canonical name of this type
    static var type: String { get }
    /// Specific Type subtypes
    static var specificTypes: [Thing.Type] { get }
    
    /// An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax.
    /// This is a relationship between something and a class that the thing is in.
    /// In RDFa syntax, it is better to use the native RDFa syntax - the 'typeof' attribute - for multiple types.
    /// Schema.org tools may have only weaker understanding of extra types, in particular those defined externally.
    var additionalType: URL? { get set }
    /// An alias for the item.
    var alternativeName: String? { get set }
    /// A description of the item.
    var description: String? { get set }
    /// A sub property of description. A short description of the item used to disambiguate from other, similar items.
    /// Information from other properties (in particular, name) may be necessary for the description to be useful for disambiguation.
    var disambiguatingDescription: String? { get set }
    /// The identifier property represents any kind of identifier for any kind of Thing, such as ISBNs, GTIN codes, UUIDs etc.
    /// Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL (URI) links.
    var identifier: Identifier? { get set }
    /// An image of the item. This can be a URL or a fully described ImageObject.
    var image: ImageObjectOrURL? { get set }
    /// Indicates a page (or other CreativeWork) for which this thing is the main entity being described.
    /// - Inverse property: mainEntity
    var mainEntityOfPage: CreativeWorkOrURL? { get set }
    /// The name of the item.
    var name: String? { get set }
    /// Indicates a potential Action, which describes an idealized action in which this thing would play an 'object' role.
    var potentialAction: Action? { get set }
    /// URL of a reference Web page that unambiguously indicates the item's identity. E.g. the URL of the item's Wikipedia page, Wikidata entry, or official website.
    var sameAs: [URL]? { get set }
    /// URL of the item.
    var url: URL? { get set }
    
    init(dictionary: [String : AnyObject])
}

public extension Thing {
    public static var context: String {
        return "http://www.schema.org"
    }
    
    static func initialize(dictionary: [String : AnyObject]) -> Self {
        return self.init(dictionary: dictionary)
    }
}
