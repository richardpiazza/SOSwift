import Foundation

/// The most generic kind of creative work, including books, movies, photographs,
/// software programs, etc.
public class SOCreativeWork: SOThing, CreativeWork {
    override public class var type: String {
        return "CreativeWork"
    }
    
    /// The subject matter of the content.
    public var about: Thing?
    /// The human sensory perceptual system or cognitive faculty through which a person may process or perceive information.
    public var accessMode: AccessMode?
    /// A list of single or combined accessModes that are sufficient to understand all the intellectual content of a resource.
    public var accessModeSufficient: [AccessModeSufficient]?
    /// Indicates that the resource is compatible with the referenced accessibility API
    public var accessibilityAPI: AccessibilityAPI?
    /// Identifies input methods that are sufficient to fully control the described resource
    public var accessibilityControl: AccessibilityControl?
    /// Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility
    public var accessibilityFeature: AccessibilityFeature?
    /// A characteristic of the described resource that is physiologically dangerous to some users.
    public var accessibilityHazard: AccessibilityHazard?
    /// A human-readable summary of specific accessibility features or deficiencies, consistent with the other accessibility metadata but expressing subtleties such as "short descriptions are present but long descriptions will be needed for non-visual users" or "short descriptions are present and no long descriptions are needed."
    public var accessibilitySummary: String?
    /// Specifies the Person that is legally accountable for the CreativeWork.
    public var accountablePerson: Person?
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// A secondary title of the CreativeWork.
    public var alternativeHeadline: String?
    /// A media object that encodes this CreativeWork. This property is a synonym for encoding.
    public var associatedMedia: MediaObject?
    /// An intended audience, i.e. a group for whom something was created.
    public var audience: Audience?
    /// An embedded audio object.
    public var audio: AudioObject?
    /// The author of this content or rating. Please note that author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.
    public var author: OrganizationOrPerson?
    /// An award won by or for this item.
    public var award: String?
    /// Fictional person connected with a creative work.
    public var character: Person?
    /// A citation or reference to another creative work, such as another publication, web page, scholarly article, etc.
    public var citation: CreativeWorkOrText?
    /// Comments, typically from users.
    public var comment: Comment?
    /// The number of comments this CreativeWork (e.g. Article, Question or Answer) has received. This is most applicable to works published in Web sites with commenting system; additional comments may exist elsewhere.
    public var commentCount: Int?
    /// The location depicted or described in the content. For example, the location in a photograph or painting.
    public var contentLocation: Place?
    /// Official rating of a piece of content—for example,'MPAA PG-13'.
    public var contentRating: String?
    /// A secondary contributor to the CreativeWork or Event.
    public var contributor: OrganizationOrPerson?
    /// The party holding the legal copyright to the CreativeWork.
    public var copyrightHolder: OrganizationOrPerson?
    /// The year during which the claimed copyright for the CreativeWork was first asserted.
    public var copyrightYear: Int?
    /// The creator/author of this CreativeWork. This is the same as the Author property for CreativeWork.
    public var creator: OrganizationOrPerson?
    /// The date on which the CreativeWork was created or the item was added to a DataFeed.
    public var dateCreated: DateOnlyOrDateTime?
    /// The date on which the CreativeWork was most recently modified or when the item's entry was modified within a DataFeed.
    public var dateModified: DateOnlyOrDateTime?
    /// Date of first broadcast/publication.
    public var datePublished: DateOnly?
    /// A link to the page containing the comments of the CreativeWork.
    public var discussionURL: URL?
    /// Specifies the Person who edited the CreativeWork.
    public var editor: Person?
    /// An alignment to an established educational framework.
    public var educationalAlignment: AlignmentObject?
    /// The purpose of a work in the context of education; for example, 'assignment', 'group work'.
    public var educationalUse: String?
    /// A media object that encodes this CreativeWork. This property is a synonym for associatedMedia. 
    public var encoding: MediaObject?
    /// A creative work that this work is an example/instance/realization/derivation of. Inverse property: workExample.
    public var exampleOfWork: CreativeWork?
    /// Media type, typically MIME format (see IANA site) of the content e.g. application/zip of a SoftwareApplication binary. In cases where a CreativeWork has several media type representations, 'encoding' can be used to indicate each MediaObject alongside particular fileFormat information. Unregistered or niche file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia entry.
    public var fileFormat: TextOrURL?
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    /// Genre of the creative work, broadcast channel or group.
    public var genre: TextOrURL?
    /// Indicates a CreativeWork that is (in some sense) a part of this CreativeWork. Inverse property: isPartOf.
    public var hasPart: CreativeWork?
    /// Headline of the article.
    public var headline: String?
    /// The language of the content or performance or used in an action. Please use one of the language codes from the IETF BCP 47 standard.
    public var inLanguage: LanguageOrText?
    /// The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.
    public var interactionStatistic: InteractionCounter?
    /// The predominant mode of learning supported by the learning resource. Acceptable values are 'active', 'expositive', or 'mixed'.
    public var interactivityType: Interactivity?
    /// A flag to signal that the publication is accessible for free.
    public var isAccessibleForFree: Bool?
    /// A resource that was used in the creation of this resource. This term can be repeated for multiple sources. 
    public var isBasedOn: CreativeWorkOrProductOrURL?
    /// Indicates whether this content is family friendly.
    public var isFamilyFriendly: Bool?
    /// Indicates a CreativeWork that this CreativeWork is (in some sense) part of. Inverse property: hasPart.
    public var isPartOf: CreativeWork?
    /// Keywords or tags used to describe this content. Multiple entries in a keywords list are typically delimited by commas.
    public var keywords: String?
    /// The predominant type or kind characterizing the learning resource. For example, 'presentation', 'handout'
    public var learningResourceType: String?
    /// A license document that applies to this content, typically indicated by URL.
    public var license: CreativeWorkOrURL?
    /// The location where the CreativeWork was created, which may not be the same as the location depicted in the CreativeWork.
    public var locationCreated: Place?
    /// Indicates the primary entity described in some page or other CreativeWork. Inverse property: mainEntityOfPage.
    public var mainEntity: Thing?
    /// A material that something is made from, e.g. leather, wool, cotton, paper.
    public var material: ProductOrTextOrURL?
    /// Indicates that the CreativeWork contains a reference to, but is not necessarily about a concept.
    public var mentions: Thing?
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event.
    public var offers: [Offer]?
    /// The position of an item in a series or sequence of items.
    public var position: IntegerOrText?
    /// The person or organization who produced the work (e.g. music album, movie, tv/radio series etc.).
    public var producer: OrganizationOrPerson?
    /// The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller. 
    public var provider: OrganizationOrPerson?
    /// The place and time the release was issued, expressed as a PublicationEvent.
    public var releasedEvent: PublicationEvent?
    /// A review of the item.
    public var review: Review?
    /// Indicates (by URL or string) a particular version of a schema used in some CreativeWork. For example, a document could declare a schemaVersion using an URL such as http://schema.org/version/2.0/ if precise indication of schema version was required by some application.
    public var schemaVersion: TextOrURL?
    /// The Organization on whose behalf the creator was working.
    public var sourceOrganization: Organization?
    /// The spatialCoverage of a CreativeWork indicates the place(s) which are the focus of the content. It is a subproperty of contentLocation intended primarily for more technical and detailed materials. For example with a Dataset, it indicates areas that the dataset describes: a dataset of New York weather would have spatialCoverage which was the place: the state of New York.
    public var spatialCoverage: Place?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// The temporalCoverage of a CreativeWork indicates the period that the content applies to, i.e. that it describes, either as a DateTime or as a textual string indicating a time period in ISO 8601 time interval format. In the case of a Dataset it will typically indicate the relevant time period in a precise notation (e.g. for a 2011 census dataset, the year 2011 would be written "2011/2012"). Other forms of content e.g. ScholarlyArticle, Book, TVSeries or TVEpisode may indicate their temporalCoverage in broader terms - textually or via well-known URL. Written works such as books may sometimes have precise temporal coverage too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601 interval format format via "1939/1945".
    public var temporalCoverage: DateTimeOrTextOrURL?
    /// The textual content of this CreativeWork.
    public var text: String?
    /// A thumbnail image relevant to the Thing.
    public var thumbnailURL: URL?
    /// Approximate or typical time it takes to work with or through this learning resource for the typical intended target audience, e.g. 'P30M', 'P1H25M'.
    public var timeRequired: Duration?
    /// Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.
    public var translator: OrganizationOrPerson?
    /// The typical expected age range, e.g. '7-9', '11-'.
    public var typicalAgeRange: String?
    /// The version of the CreativeWork embodied by a specified resource.
    public var version: IntegerOrText?
    /// An embedded video object.
    public var video: VideoObject?
    /// Example/instance/realization/derivation of the concept of this creative work. eg. The paperback edition, first edition, or eBook. Inverse property: exampleOfWork.
    public var workExample: CreativeWork?
}
