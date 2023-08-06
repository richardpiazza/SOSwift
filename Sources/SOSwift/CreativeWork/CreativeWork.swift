import Foundation

/// The most generic kind of creative work, including books, movies,
/// photographs, software programs, etc.
public class CreativeWork: Thing {
    
    /// The subject matter of the content.
    public var about: Thing?
    
    /// The human sensory perceptual system or cognitive faculty through which a
    /// person may process or perceive information.
    public var accessMode: AccessMode?
    
    /// A list of single or combined accessModes that are sufficient to
    /// understand all the intellectual content of a resource.
    public var accessModeSufficients: [AccessModeSufficient]?
    
    /// Indicates that the resource is compatible with the referenced
    /// accessibility API
    public var accessibilityAPI: AccessibilityAPI?
    
    /// Identifies input methods that are sufficient to fully control the
    /// described resource
    public var accessibilityControl: AccessibilityControl?
    
    /// Content features of the resource, such as accessible media, alternatives
    /// and supported enhancements for accessibility
    public var accessibilityFeature: AccessibilityFeature?
    
    /// A characteristic of the described resource that is physiologically
    /// dangerous to some users.
    public var accessibilityHazard: AccessibilityHazard?
    
    /// A human-readable summary of specific accessibility features or
    /// deficiencies, consistent with the other accessibility metadata but
    /// expressing subtleties such as "short descriptions are present but long
    /// descriptions will be needed for non-visual users" or "short descriptions
    /// are present and no long descriptions are needed."
    public var accessibilitySummary: String?
    
    /// Specifies the Person that is legally accountable for the CreativeWork.
    public var accountablePerson: Person?
    
    /// The overall rating, based on a collection of reviews or ratings, of the
    /// item.
    public var aggregateRating: AggregateRating?
    
    /// A secondary title of the CreativeWork.
    public var alternativeHeadline: String?
    
    /// A media object that encodes this CreativeWork. This property is a
    /// synonym for encoding.
    public var associatedMedia: MediaObject?
    
    /// An intended audience, i.e. a group for whom something was created.
    public var audience: Audience?
    
    /// An embedded audio object.
    public var audio: AudioObject?
    
    /// The author of this content or rating. Please note that author is special
    /// in that HTML 5 provides a special mechanism for indicating authorship
    /// via the rel tag. That is equivalent to this and may be used
    /// interchangeably.
    public var author: OrganizationOrPerson?
    
    /// An award won by or for this item.
    public var award: String?
    
    /// Fictional person connected with a creative work.
    public var character: Person?
    
    /// A citation or reference to another creative work, such as another
    /// publication, web page, scholarly article, etc.
    public var citation: CreativeWorkOrText?
    
    /// Comments, typically from users.
    public var comment: Comment?
    
    /// The number of comments this CreativeWork (e.g. Article, Question or
    /// Answer) has received. This is most applicable to works published in Web
    /// sites with commenting system; additional comments may exist elsewhere.
    public var commentCount: Int?
    
    /// The location depicted or described in the content. For example, the
    /// location in a photograph or painting.
    public var contentLocation: Place?
    
    /// Official rating of a piece of content—for example,'MPAA PG-13'.
    public var contentRating: String?
    
    /// The specific time described by a creative work, for works (e.g.
    /// articles, video objects etc.) that emphasise a particular moment
    /// within an Event.
    public var contentReferenceTime: DateTime?
    
    /// A secondary contributor to the CreativeWork or Event.
    public var contributor: OrganizationOrPerson?
    
    /// The party holding the legal copyright to the CreativeWork.
    public var copyrightHolder: OrganizationOrPerson?
    
    /// The year during which the claimed copyright for the CreativeWork was
    /// first asserted.
    public var copyrightYear: Int?
    
    /// The creator/author of this CreativeWork. This is the same as the Author
    /// property for CreativeWork.
    public var creator: OrganizationOrPerson?
    
    /// The date on which the CreativeWork was created or the item was added to
    /// a DataFeed.
    public var dateCreated: DateOnlyOrDateTime?
    
    /// The date on which the CreativeWork was most recently modified or when
    /// the item's entry was modified within a DataFeed.
    public var dateModified: DateOnlyOrDateTime?
    
    /// Date of first broadcast/publication.
    public var datePublished: DateOnly?
    
    /// A link to the page containing the comments of the CreativeWork.
    public var discussionURL: URL?
    
    /// Specifies the Person who edited the CreativeWork.
    public var editor: Person?
    
    /// An alignment to an established educational framework.
    public var educationalAlignment: AlignmentObject?
    
    /// The purpose of a work in the context of education; for example,
    /// 'assignment', 'group work'.
    public var educationalUse: String?
    
    /// A media object that encodes this CreativeWork. This property is a
    /// synonym for associatedMedia.
    public var encoding: MediaObject?
    
    /// A creative work that this work is an example/instance/realization/
    /// derivation of.
    /// - **Inverse property**: _workExample_
    public var exampleOfWork: CreativeWork?
    
    /// Media type, typically MIME format (see IANA site) of the content e.g.
    /// application/zip of a SoftwareApplication binary.
    ///
    /// In cases where a CreativeWork has several media type representations,
    /// 'encoding' can be used to indicate each MediaObject alongside particular
    /// fileFormat information. Unregistered or niche file formats can be
    /// indicated instead via the most appropriate URL, e.g. defining Web page
    /// or a Wikipedia entry.
    public var fileFormat: URLOrText?
    
    /// A person or organization that supports (sponsors) something through some
    /// kind of financial contribution.
    public var funder: OrganizationOrPerson?
    
    /// Genre of the creative work, broadcast channel or group.
    public var genre: URLOrText?
    
    /// Indicates a CreativeWork that is (in some sense) a part of this
    /// CreativeWork.
    /// - **Inverse property**: _isPartOf_.
    public var part: CreativeWork?
    
    /// Headline of the article.
    public var headline: String?
    
    /// The language of the content or performance or used in an action. Please
    /// use one of the language codes from the IETF BCP 47 standard.
    public var inLanguage: LanguageOrText?
    
    /// The number of interactions for the CreativeWork using the WebSite or
    /// SoftwareApplication. The most specific child type of InteractionCounter
    /// should be used.
    public var interactionStatistic: InteractionCounter?
    
    /// The predominant mode of learning supported by the learning resource.
    /// Acceptable values are 'active', 'expositive', or 'mixed'.
    public var interactivityType: Interactivity?
    
    /// A flag to signal that the publication is accessible for free.
    public var isAccessibleForFree: Bool?
    
    /// A resource that was used in the creation of this resource. This term can
    /// be repeated for multiple sources.
    public var basedOn: CreativeWorkOrProductOrURL?
    
    /// Indicates whether this content is family friendly.
    public var isFamilyFriendly: Bool?
    
    /// Indicates a CreativeWork that this CreativeWork is (in some sense) part
    /// of. Inverse property: hasPart.
    public var partOf: CreativeWork?
    
    /// Keywords or tags used to describe this content. Multiple entries in a
    /// keywords list are typically delimited by commas.
    public var keywords: String?
    
    /// The predominant type or kind characterizing the learning resource. For
    /// example, 'presentation', 'handout'
    public var learningResourceType: String?
    
    /// A license document that applies to this content, typically indicated by
    /// URL.
    public var license: CreativeWorkOrURL?
    
    /// The location where the CreativeWork was created, which may not be the
    /// same as the location depicted in the CreativeWork.
    public var locationCreated: Place?
    
    /// Indicates the primary entity described in some page or other
    /// CreativeWork.
    ///
    /// - **Inverse property**: _mainEntityOfPage_
    public var mainEntity: Thing?
    
    /// A material that something is made from, e.g. leather, wool, cotton,
    /// paper.
    public var material: ProductOrURLOrText?
    
    /// Indicates that the CreativeWork contains a reference to, but is not
    /// necessarily about a concept.
    public var mentions: Thing?
    
    /// An offer to provide this item—for example, an offer to sell a product,
    /// rent the DVD of a movie, perform a service, or give away tickets to an
    /// event.
    public var offers: [Offer]?
    
    /// The position of an item in a series or sequence of items.
    public var position: IntegerOrText?
    
    /// The person or organization who produced the work (e.g. music album,
    /// movie, tv/radio series etc.).
    public var producer: OrganizationOrPerson?
    
    /// The service provider, service operator, or service performer; the goods
    /// producer. Another party (a seller) may offer those services or goods on
    /// behalf of the provider. A provider may also serve as the seller.
    public var provider: OrganizationOrPerson?
    
    /// A publication event associated with the item.
    public var publication: PublicationEvent?
    
    /// The publisher of the creative work.
    public var publisher: OrganizationOrPerson?
    
    /// The publishing division which published the comic.
    public var publisherImprint: Organization?
    
    /// The publishingPrinciples property indicates (typically via URL) a
    /// document describing the editorial principles of an Organization (or
    /// individual e.g. a Person writing a blog) that relate to their activities
    /// as a publisher, e.g. ethics or diversity policies. When applied to a
    /// CreativeWork (e.g. NewsArticle) the principles are those of the party
    /// primarily responsible for the creation of the CreativeWork.
    /// While such policies are most typically expressed in natural language,
    /// sometimes related information (e.g. indicating a funder) can be
    /// expressed using schema.org terminology.
    public var publishingPrinciples: CreativeWorkOrURL?
    
    /// The Event where the CreativeWork was recorded. The CreativeWork may
    /// capture all or part of the event.
    /// - Inverse property: recordedIn.
    public var recordedAt: Event?
    
    /// The place and time the release was issued, expressed as a
    /// PublicationEvent.
    public var releasedEvent: PublicationEvent?
    
    /// A review of the item.
    /// - schema.org property name: review
    public var reviews: [Review]?
    
    /// Indicates (by URL or string) a particular version of a schema used in
    /// some CreativeWork. For example, a document could declare a schemaVersion
    /// using an URL such as http://schema.org/version/2.0/ if precise
    /// indication of schema version was required by some application.
    public var schemaVersion: URLOrText?
    
    /// The Organization on whose behalf the creator was working.
    public var sourceOrganization: Organization?
    
    /// The spatialCoverage of a CreativeWork indicates the place(s) which are
    /// the focus of the content. It is a subproperty of contentLocation
    /// intended primarily for more technical and detailed materials. For
    /// example with a Dataset, it indicates areas that the dataset describes: a
    /// dataset of New York weather would have spatialCoverage which was the
    /// place: the state of New York.
    public var spatialCoverage: Place?
    
    /// A person or organization that supports a thing through a pledge,
    /// promise, or financial contribution. e.g. a sponsor of a Medical Study or
    /// a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    
    /// The temporalCoverage of a CreativeWork indicates the period that the
    /// content applies to, i.e. that it describes, either as a DateTime or as a
    /// textual string indicating a time period in ISO 8601 time interval
    /// format.
    /// In the case of a Dataset it will typically indicate the relevant time
    /// period in a precise notation (e.g. for a 2011 census dataset, the 2011
    /// would be written "2011/2012"). Other forms of content e.g.
    /// ScholarlyArticle, Book, TVSeries or TVEpisode may indicate their
    /// temporalCoverage in broader terms - textually or via well-known URL.
    /// Written works such as books may sometimes have precise temporal coverage
    /// too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601
    /// interval format format via "1939/1945".
    public var temporalCoverage: DateTimeOrURLOrText?
    
    /// The textual content of this CreativeWork.
    public var text: String?
    
    /// A thumbnail image relevant to the Thing.
    public var thumbnailUrl: URL?
    
    /// Approximate or typical time it takes to work with or through this
    /// learning resource for the typical intended target audience, e.g. 'P30M',
    /// 'P1H25M'.
    public var timeRequired: Duration?
    
    /// The work that this work has been translated from. e.g. 物种起源 is a
    /// translationOf “On the Origin of Species”
    /// - Inverse property: workTranslation.
    public var translationOfWork: CreativeWork?
    
    /// Organization or person who adapts a creative work to different
    /// languages, regional differences and technical requirements of a target
    /// market, or that translates during some event.
    public var translator: OrganizationOrPerson?
    
    /// The typical expected age range, e.g. '7-9', '11-'.
    public var typicalAgeRange: String?
    
    /// The version of the CreativeWork embodied by a specified resource.
    public var version: IntegerOrText?
    
    /// An embedded video object.
    public var video: VideoObject?
    
    /// Example/instance/realization/derivation of the concept of this creative
    /// work. eg. The paperback edition, first edition, or eBook.
    /// - **Inverse property**: _exampleOfWork_
    public var workExample: CreativeWork?
    
    /// A work that is a translation of the content of this work. e.g. 西遊記 has
    /// an English workTranslation “Journey to the West”,a German
    /// workTranslation “Monkeys Pilgerfahrt” and a Vietnamese translation Tây
    /// du ký bình khảo.
    /// - **Inverse property**: _translationOfWork_
    public var workTranslation: CreativeWork?
    
    internal enum CreativeWorkCodingKeys: String, CodingKey {
        case about
        case accessMode
        case accessModeSufficients = "accessModeSufficient"
        case accessibilityAPI
        case accessibilityControl
        case accessibilityFeature
        case accessibilityHazard
        case accessibilitySummary
        case accountablePerson
        case aggregateRating
        case alternativeHeadline
        case associatedMedia
        case audience
        case audio
        case author
        case award
        case character
        case citation
        case comment
        case commentCount
        case contentLocation
        case contentRating
        case contentReferenceTime
        case contributor
        case copyrightHolder
        case copyrightYear
        case creator
        case dateCreated
        case dateModified
        case datePublished
        case discussionURL
        case editor
        case educationalAlignment
        case educationalUse
        case encoding
        case exampleOfWork
        case fileFormat
        case funder
        case genre
        case part = "hasPart"
        case headline
        case inLanguage
        case interactionStatistic
        case interactivityType
        case isAccessibleForFree
        case basedOn = "isBasedOn"
        case isFamilyFriendly
        case partOf = "isPartOf"
        case keywords
        case learningResourceType
        case license
        case locationCreated
        case mainEntity
        case material
        case mentions
        case offers
        case position
        case producer
        case provider
        case publication
        case publisher
        case publisherImprint
        case publishingPrinciples
        case recordedAt
        case releasedEvent
        case reviews = "review"
        case schemaVersion
        case sourceOrganization
        case spatialCoverage
        case sponsor
        case temporalCoverage
        case text
        case thumbnailUrl
        case timeRequired
        case translationOfWork
        case translator
        case typicalAgeRange
        case version
        case video
        case workExample
        case workTranslation
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CreativeWorkCodingKeys.self)
        
        about = try container.decodeIfPresent(Thing.self, forKey: .about)
        accessMode = try container.decodeIfPresent(AccessMode.self, forKey: .accessMode)
        accessModeSufficients = try container.decodeIfPresent([AccessModeSufficient].self, forKey: .accessModeSufficients)
        accessibilityAPI = try container.decodeIfPresent(AccessibilityAPI.self, forKey: .accessibilityAPI)
        accessibilityControl = try container.decodeIfPresent(AccessibilityControl.self, forKey: .accessibilityControl)
        accessibilityFeature = try container.decodeIfPresent(AccessibilityFeature.self, forKey: .accessibilityFeature)
        accessibilityHazard = try container.decodeIfPresent(AccessibilityHazard.self, forKey: .accessibilityHazard)
        accessibilitySummary = try container.decodeIfPresent(String.self, forKey: .accessibilitySummary)
        accountablePerson = try container.decodeIfPresent(Person.self, forKey: .accountablePerson)
        aggregateRating = try container.decodeIfPresent(AggregateRating.self, forKey: .aggregateRating)
        alternativeHeadline = try container.decodeIfPresent(String.self, forKey: .alternativeHeadline)
        associatedMedia = try container.decodeIfPresent(MediaObject.self, forKey: .associatedMedia)
        audience = try container.decodeIfPresent(Audience.self, forKey: .audience)
        audio = try container.decodeIfPresent(AudioObject.self, forKey: .audio)
        author = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .author)
        award = try container.decodeIfPresent(String.self, forKey: .award)
        character = try container.decodeIfPresent(Person.self, forKey: .character)
        citation = try container.decodeIfPresent(CreativeWorkOrText.self, forKey: .citation)
        comment = try container.decodeIfPresent(Comment.self, forKey: .comment)
        commentCount = try container.decodeIfPresent(Int.self, forKey: .commentCount)
        contentLocation = try container.decodeIfPresent(Place.self, forKey: .contentLocation)
        contentRating = try container.decodeIfPresent(String.self, forKey: .contentRating)
        contentReferenceTime = try container.decodeIfPresent(DateTime.self, forKey: .contentReferenceTime)
        contributor = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .contributor)
        copyrightHolder = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .copyrightHolder)
        copyrightYear = try container.decodeIfPresent(Int.self, forKey: .copyrightYear)
        creator = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .creator)
        dateCreated = try container.decodeIfPresent(DateOnlyOrDateTime.self, forKey: .dateCreated)
        dateModified = try container.decodeIfPresent(DateOnlyOrDateTime.self, forKey: .dateModified)
        datePublished = try container.decodeIfPresent(DateOnly.self, forKey: .datePublished)
        discussionURL = try container.decodeIfPresent(URL.self, forKey: .discussionURL)
        editor = try container.decodeIfPresent(Person.self, forKey: .editor)
        educationalAlignment = try container.decodeIfPresent(AlignmentObject.self, forKey: .educationalAlignment)
        educationalUse = try container.decodeIfPresent(String.self, forKey: .educationalUse)
        encoding = try container.decodeIfPresent(MediaObject.self, forKey: .encoding)
        exampleOfWork = try container.decodeIfPresent(CreativeWork.self, forKey: .exampleOfWork)
        fileFormat = try container.decodeIfPresent(URLOrText.self, forKey: .fileFormat)
        funder = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .funder)
        genre = try container.decodeIfPresent(URLOrText.self, forKey: .genre)
        part = try container.decodeIfPresent(CreativeWork.self, forKey: .part)
        headline = try container.decodeIfPresent(String.self, forKey: .headline)
        inLanguage = try container.decodeIfPresent(LanguageOrText.self, forKey: .inLanguage)
        interactionStatistic = try container.decodeIfPresent(InteractionCounter.self, forKey: .interactionStatistic)
        interactivityType = try container.decodeIfPresent(Interactivity.self, forKey: .interactivityType)
        isAccessibleForFree = try container.decodeIfPresent(Bool.self, forKey: .isAccessibleForFree)
        basedOn = try container.decodeIfPresent(CreativeWorkOrProductOrURL.self, forKey: .basedOn)
        isFamilyFriendly = try container.decodeIfPresent(Bool.self, forKey: .isFamilyFriendly)
        partOf = try container.decodeIfPresent(CreativeWork.self, forKey: .partOf)
        keywords = try container.decodeIfPresent(String.self, forKey: .keywords)
        learningResourceType = try container.decodeIfPresent(String.self, forKey: .learningResourceType)
        license = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .license)
        locationCreated = try container.decodeIfPresent(Place.self, forKey: .locationCreated)
        mainEntity = try container.decodeIfPresent(Thing.self, forKey: .mainEntity)
        material = try container.decodeIfPresent(ProductOrURLOrText.self, forKey: .material)
        mentions = try container.decodeIfPresent(Thing.self, forKey: .mentions)
        offers = try container.decodeIfPresent([Offer].self, forKey: .offers)
        position = try container.decodeIfPresent(IntegerOrText.self, forKey: .position)
        producer = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .producer)
        provider = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .provider)
        publication = try container.decodeIfPresent(PublicationEvent.self, forKey: .publication)
        publisher = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .publisher)
        publisherImprint = try container.decodeIfPresent(Organization.self, forKey: .publisherImprint)
        publishingPrinciples = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .publishingPrinciples)
        recordedAt = try container.decodeIfPresent(Event.self, forKey: .recordedAt)
        releasedEvent = try container.decodeIfPresent(PublicationEvent.self, forKey: .releasedEvent)
        reviews = try container.decodeIfPresent([Review].self, forKey: .reviews)
        schemaVersion = try container.decodeIfPresent(URLOrText.self, forKey: .schemaVersion)
        sourceOrganization = try container.decodeIfPresent(Organization.self, forKey: .sourceOrganization)
        spatialCoverage = try container.decodeIfPresent(Place.self, forKey: .spatialCoverage)
        sponsor = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .sponsor)
        temporalCoverage = try container.decodeIfPresent(DateTimeOrURLOrText.self, forKey: .temporalCoverage)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        thumbnailUrl = try container.decodeIfPresent(URL.self, forKey: .thumbnailUrl)
        timeRequired = try container.decodeIfPresent(Duration.self, forKey: .timeRequired)
        translationOfWork = try container.decodeIfPresent(CreativeWork.self, forKey: .translationOfWork)
        translator = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .translator)
        typicalAgeRange = try container.decodeIfPresent(String.self, forKey: .typicalAgeRange)
        version = try container.decodeIfPresent(IntegerOrText.self, forKey: .version)
        video = try container.decodeIfPresent(VideoObject.self, forKey: .video)
        workExample = try container.decodeIfPresent(CreativeWork.self, forKey: .workExample)
        workTranslation = try container.decodeIfPresent(CreativeWork.self, forKey: .workTranslation)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CreativeWorkCodingKeys.self)
        
        try container.encodeIfPresent(about, forKey: .about)
        try container.encodeIfPresent(accessMode, forKey: .accessMode)
        try container.encodeIfPresent(accessModeSufficients, forKey: .accessModeSufficients)
        try container.encodeIfPresent(accessibilityAPI, forKey: .accessibilityAPI)
        try container.encodeIfPresent(accessibilityControl, forKey: .accessibilityControl)
        try container.encodeIfPresent(accessibilityFeature, forKey: .accessibilityFeature)
        try container.encodeIfPresent(accessibilityHazard, forKey: .accessibilityHazard)
        try container.encodeIfPresent(accessibilitySummary, forKey: .accessibilitySummary)
        try container.encodeIfPresent(accountablePerson, forKey: .accountablePerson)
        try container.encodeIfPresent(aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(alternativeHeadline, forKey: .alternativeHeadline)
        try container.encodeIfPresent(associatedMedia, forKey: .associatedMedia)
        try container.encodeIfPresent(audience, forKey: .audience)
        try container.encodeIfPresent(audio, forKey: .audio)
        try container.encodeIfPresent(award, forKey: .award)
        try container.encodeIfPresent(character, forKey: .character)
        try container.encodeIfPresent(citation, forKey: .citation)
        try container.encodeIfPresent(comment, forKey: .comment)
        try container.encodeIfPresent(commentCount, forKey: .commentCount)
        try container.encodeIfPresent(contentLocation, forKey: .contentLocation)
        try container.encodeIfPresent(contentRating, forKey: .contentRating)
        try container.encodeIfPresent(contentReferenceTime, forKey: .contentReferenceTime)
        try container.encodeIfPresent(contributor, forKey: .contributor)
        try container.encodeIfPresent(copyrightHolder, forKey: .copyrightHolder)
        try container.encodeIfPresent(copyrightYear, forKey: .copyrightYear)
        try container.encodeIfPresent(creator, forKey: .creator)
        try container.encodeIfPresent(dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(dateModified, forKey: .dateModified)
        try container.encodeIfPresent(datePublished, forKey: .datePublished)
        try container.encodeIfPresent(discussionURL, forKey: .discussionURL)
        try container.encodeIfPresent(editor, forKey: .editor)
        try container.encodeIfPresent(educationalAlignment, forKey: .educationalAlignment)
        try container.encodeIfPresent(educationalUse, forKey: .educationalUse)
        try container.encodeIfPresent(encoding, forKey: .encoding)
        try container.encodeIfPresent(exampleOfWork, forKey: .exampleOfWork)
        try container.encodeIfPresent(fileFormat, forKey: .fileFormat)
        try container.encodeIfPresent(funder, forKey: .funder)
        try container.encodeIfPresent(genre, forKey: .genre)
        try container.encodeIfPresent(part, forKey: .part)
        try container.encodeIfPresent(headline, forKey: .headline)
        try container.encodeIfPresent(inLanguage, forKey: .inLanguage)
        try container.encodeIfPresent(interactionStatistic, forKey: .interactionStatistic)
        try container.encodeIfPresent(interactivityType, forKey: .interactivityType)
        try container.encodeIfPresent(isAccessibleForFree, forKey: .isAccessibleForFree)
        try container.encodeIfPresent(basedOn, forKey: .basedOn)
        try container.encodeIfPresent(isFamilyFriendly, forKey: .isFamilyFriendly)
        try container.encodeIfPresent(partOf, forKey: .partOf)
        try container.encodeIfPresent(keywords, forKey: .keywords)
        try container.encodeIfPresent(learningResourceType, forKey: .learningResourceType)
        try container.encodeIfPresent(license, forKey: .license)
        try container.encodeIfPresent(locationCreated, forKey: .locationCreated)
        try container.encodeIfPresent(mainEntity, forKey: .mainEntity)
        try container.encodeIfPresent(material, forKey: .material)
        try container.encodeIfPresent(mentions, forKey: .mentions)
        try container.encodeIfPresent(offers, forKey: .offers)
        try container.encodeIfPresent(position, forKey: .position)
        try container.encodeIfPresent(producer, forKey: .producer)
        try container.encodeIfPresent(provider, forKey: .provider)
        try container.encodeIfPresent(publication, forKey: .publication)
        try container.encodeIfPresent(publisher, forKey: .publisher)
        try container.encodeIfPresent(publisherImprint, forKey: .publisherImprint)
        try container.encodeIfPresent(publishingPrinciples, forKey: .publishingPrinciples)
        try container.encodeIfPresent(recordedAt, forKey: .recordedAt)
        try container.encodeIfPresent(releasedEvent, forKey: .releasedEvent)
        try container.encodeIfPresent(reviews, forKey: .reviews)
        try container.encodeIfPresent(schemaVersion, forKey: .schemaVersion)
        try container.encodeIfPresent(sourceOrganization, forKey: .sourceOrganization)
        try container.encodeIfPresent(spatialCoverage, forKey: .spatialCoverage)
        try container.encodeIfPresent(sponsor, forKey: .sponsor)
        try container.encodeIfPresent(temporalCoverage, forKey: .temporalCoverage)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encodeIfPresent(timeRequired, forKey: .timeRequired)
        try container.encodeIfPresent(translationOfWork, forKey: .translationOfWork)
        try container.encodeIfPresent(translator, forKey: .translator)
        try container.encodeIfPresent(typicalAgeRange, forKey: .typicalAgeRange)
        try container.encodeIfPresent(version, forKey: .version)
        try container.encodeIfPresent(video, forKey: .video)
        try container.encodeIfPresent(workExample, forKey: .workExample)
        try container.encodeIfPresent(workTranslation, forKey: .workTranslation)
        
        try super.encode(to: encoder)
    }
}
