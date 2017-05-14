import Foundation

public protocol CreativeWorkConformance:
                    CreativeWorkOrURL,
                    CreativeWorkOrText,
                    CreativeWorkOrProductOrURL
                {}

/// The most generic kind of creative work, including books, movies, photographs, software programs, etc.
public protocol CreativeWork: Thing, CreativeWorkConformance {
    /// The subject matter of the content.
    var about: Thing? { get set }
    /// The human sensory perceptual system or cognitive faculty through which a person may process or perceive information.
    var accessMode: AccessMode? { get set }
    /// A list of single or combined accessModes that are sufficient to understand all the intellectual content of a resource.
    var accessModeSufficient: [AccessModeSufficient]? { get set }
    /// Indicates that the resource is compatible with the referenced accessibility API
    var accessibilityAPI: AccessibilityAPI? { get set }
    /// Identifies input methods that are sufficient to fully control the described resource
    var accessibilityControl: AccessibilityControl? { get set }
    /// Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility
    var accessibilityFeature: AccessibilityFeature? { get set }
    /// A characteristic of the described resource that is physiologically dangerous to some users.
    var accessibilityHazard: AccessibilityHazard? { get set }
    /// A human-readable summary of specific accessibility features or deficiencies, consistent with the other accessibility metadata but expressing subtleties such as "short descriptions are present but long descriptions will be needed for non-visual users" or "short descriptions are present and no long descriptions are needed."
    var accessibilitySummary: String? { get set }
    /// Specifies the Person that is legally accountable for the CreativeWork.
    var accountablePerson: Person? { get set }
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    var aggregateRating: AggregateRating? { get set }
    /// A secondary title of the CreativeWork.
    var alternativeHeadline: String? { get set }
    /// A media object that encodes this CreativeWork. This property is a synonym for encoding.
    var associatedMedia: MediaObject? { get set }
    /// An intended audience, i.e. a group for whom something was created.
    var audience: Audience? { get set }
    /// An embedded audio object.
    var audio: AudioObject? { get set }
    /// The author of this content or rating.
    /// - note: The author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.
    var author: OrganizationOrPerson? { get set }
    /// An award won by or for this item.
    var award: String? { get set }
    /// Fictional person connected with a creative work.
    var character: Person? { get set }
    /// A citation or reference to another creative work, such as another publication, web page, scholarly article, etc.
    var citation: CreativeWorkOrText? { get set }
    /// Comments, typically from users.
    var comment: Comment? { get set }
    /// The number of comments this CreativeWork (e.g. Article, Question or Answer) has received. This is most applicable to works published in Web sites with commenting system; additional comments may exist elsewhere.
    var commentCount: Int? { get set }
    /// The location depicted or described in the content. For example, the location in a photograph or painting.
    var contentLocation: Place? { get set }
    /// Official rating of a piece of content—for example,'MPAA PG-13'.
    var contentRating: String? { get set }
    /// A secondary contributor to the CreativeWork or Event.
    var contributor: OrganizationOrPerson? { get set }
    /// The party holding the legal copyright to the CreativeWork.
    var copyrightHolder: OrganizationOrPerson? { get set }
    /// The year during which the claimed copyright for the CreativeWork was first asserted.
    var copyrightYear: Int? { get set }
    /// The creator/author of this CreativeWork. This is the same as the Author property for CreativeWork.
    var creator: OrganizationOrPerson? { get set }
    /// The date on which the CreativeWork was created or the item was added to a DataFeed.
    var dateCreated: DateOnlyOrDateTime? { get set }
    /// The date on which the CreativeWork was most recently modified or when the item's entry was modified within a DataFeed.
    var dateModified: DateOnlyOrDateTime? { get set }
    /// Date of first broadcast/publication.
    var datePublished: DateOnly? { get set }
    /// A link to the page containing the comments of the CreativeWork.
    var discussionURL: URL? { get set }
    /// Specifies the Person who edited the CreativeWork.
    var editor: Person? { get set }
    /// An alignment to an established educational framework.
    var educationalAlignment: AlignmentObject? { get set }
    /// The purpose of a work in the context of education; for example, 'assignment', 'group work'.
    var educationalUse: String? { get set }
    /// A media object that encodes this CreativeWork. This property is a synonym for associatedMedia.
    var encoding: MediaObject? { get set }
    /// A creative work that this work is an example/instance/realization/derivation of. Inverse property: workExample.
    var exampleOfWork: CreativeWork? { get set }
    /// Media type, typically MIME format (see IANA site) of the content e.g. application/zip of a SoftwareApplication binary. In cases where a CreativeWork has several media type representations, 'encoding' can be used to indicate each MediaObject alongside particular fileFormat information. Unregistered or niche file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia entry.
    var fileFormat: TextOrURL?  { get set }
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    var funder: OrganizationOrPerson?  { get set }
    /// Genre of the creative work, broadcast channel or group.
    var genre: TextOrURL?  { get set }
    /// Indicates a CreativeWork that is (in some sense) a part of this CreativeWork. Inverse property: isPartOf.
    var hasPart: CreativeWork?  { get set }
    /// Headline of the article.
    var headline: String?  { get set }
    /// The language of the content or performance or used in an action. Please use one of the language codes from the IETF BCP 47 standard.
    var inLanguage: LanguageOrText?  { get set }
    /// The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.
    var interactionStatistic: InteractionCounter?  { get set }
    /// The predominant mode of learning supported by the learning resource. Acceptable values are 'active', 'expositive', or 'mixed'.
    var interactivityType: Interactivity?  { get set }
    /// A flag to signal that the publication is accessible for free.
    var isAccessibleForFree: Bool?  { get set }
    /// A resource that was used in the creation of this resource. This term can be repeated for multiple sources.
    var isBasedOn: CreativeWorkOrProductOrURL?  { get set }
    /// Indicates whether this content is family friendly.
    var isFamilyFriendly: Bool?  { get set }
    /// Indicates a CreativeWork that this CreativeWork is (in some sense) part of. Inverse property: hasPart.
    var isPartOf: CreativeWork?  { get set }
    /// Keywords or tags used to describe this content. Multiple entries in a keywords list are typically delimited by commas.
    var keywords: String?  { get set }
    /// The predominant type or kind characterizing the learning resource. For example, 'presentation', 'handout'
    var learningResourceType: String?  { get set }
    /// A license document that applies to this content, typically indicated by URL.
    var license: CreativeWorkOrURL?  { get set }
    /// The location where the CreativeWork was created, which may not be the same as the location depicted in the CreativeWork.
    var locationCreated: Place?  { get set }
    /// Indicates the primary entity described in some page or other CreativeWork. Inverse property: mainEntityOfPage.
    var mainEntity: Thing?  { get set }
    /// A material that something is made from, e.g. leather, wool, cotton, paper.
    var material: ProductOrTextOrURL?  { get set }
    /// Indicates that the CreativeWork contains a reference to, but is not necessarily about a concept.
    var mentions: Thing?  { get set }
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event.
    var offers: [Offer]?  { get set }
    /// The position of an item in a series or sequence of items.
    var position: IntegerOrText?  { get set }
    /// The person or organization who produced the work (e.g. music album, movie, tv/radio series etc.).
    var producer: OrganizationOrPerson?  { get set }
    /// The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.
    var provider: OrganizationOrPerson?  { get set }
    /// The place and time the release was issued, expressed as a PublicationEvent.
    var releasedEvent: PublicationEvent?  { get set }
    /// A review of the item.
    var review: Review?  { get set }
    /// Indicates (by URL or string) a particular version of a schema used in some CreativeWork. For example, a document could declare a schemaVersion using an URL such as http://schema.org/version/2.0/ if precise indication of schema version was required by some application.
    var schemaVersion: TextOrURL?  { get set }
    /// The Organization on whose behalf the creator was working.
    var sourceOrganization: Organization?  { get set }
    /// The spatialCoverage of a CreativeWork indicates the place(s) which are the focus of the content. It is a subproperty of contentLocation intended primarily for more technical and detailed materials. For example with a Dataset, it indicates areas that the dataset describes: a dataset of New York weather would have spatialCoverage which was the place: the state of New York.
    var spatialCoverage: Place?  { get set }
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    var sponsor: OrganizationOrPerson?  { get set }
    /// The temporalCoverage of a CreativeWork indicates the period that the content applies to, i.e. that it describes, either as a DateTime or as a textual string indicating a time period in ISO 8601 time interval format. In the case of a Dataset it will typically indicate the relevant time period in a precise notation (e.g. for a 2011 census dataset, the year 2011 would be written "2011/2012"). Other forms of content e.g. ScholarlyArticle, Book, TVSeries or TVEpisode may indicate their temporalCoverage in broader terms - textually or via well-known URL. Written works such as books may sometimes have precise temporal coverage too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601 interval format format via "1939/1945".
    var temporalCoverage: DateTimeOrTextOrURL?  { get set }
    /// The textual content of this CreativeWork.
    var text: String?  { get set }
    /// A thumbnail image relevant to the Thing.
    var thumbnailUrl: URL?  { get set }
    /// Approximate or typical time it takes to work with or through this learning resource for the typical intended target audience, e.g. 'P30M', 'P1H25M'.
    var timeRequired: Duration?  { get set }
    /// Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.
    var translator: OrganizationOrPerson?  { get set }
    /// The typical expected age range, e.g. '7-9', '11-'.
    var typicalAgeRange: String?  { get set }
    /// The version of the CreativeWork embodied by a specified resource.
    var version: IntegerOrText?  { get set }
    /// An embedded video object.
    var video: VideoObject?  { get set }
    /// Example/instance/realization/derivation of the concept of this creative work. eg. The paperback edition, first edition, or eBook. Inverse property: exampleOfWork.
    var workExample: CreativeWork?  { get set }
}

