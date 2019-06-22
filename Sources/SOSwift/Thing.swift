import Foundation

/// The most generic type of item/entity.
public class Thing: Schema {
    
    /// An additional type for the item, typically used for adding more specific
    /// types from external vocabularies in microdata syntax.
    ///
    /// This is a relationship between something and a class that the thing is
    /// in. In RDFa syntax, it is better to use the native RDFa syntax - the
    /// 'typeof' attribute - for multiple types. Schema.org tools may have only
    /// weaker understanding of extra types, in particular those defined
    /// externally.
    public var additionalType: URL?
    
    /// An alias for the item.
    public var alternativeName: String?
    
    /// A description of the item.
    public var description: String?
    
    /// A sub property of description.
    ///
    /// A short description of the item used to disambiguate from other, similar
    /// items. Information from other properties (in particular, name) may be
    /// necessary for the description to be useful for disambiguation.
    public var disambiguatingDescription: String?
    
    /// An image of the item. This can be a URL or a fully described
    /// ImageObject.
//    public var image: ImageObjectOrURL?
    
    /// Indicates a page (or other CreativeWork) for which this thing is the
    /// main entity being described.
    /// - **Inverse property**: _mainEntity_
    public var mainEntityOfPage: CreativeWorkOrURL?
    
    /// The name of the item.
    public var name: String?
    
    /// Indicates a potential Action, which describes an idealized action in
    /// which this thing would play an 'object' role.
    public var potentialAction: Action?
    
    /// URL of a reference Web page that unambiguously indicates the item's
    /// identity. E.g. the URL of the item's Wikipedia page, Wikidata entry, or
    /// official website.
    public var sameAs: [URL]?
    
    /// A CreativeWork or Event about this Thing.
    /// - **Inverse property**: _about_
    public var subjectOf: CreativeWorkOrEvent?
    
    /// URL of the item.
    public var url: URL?
    
    
}
