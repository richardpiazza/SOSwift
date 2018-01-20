import Foundation
import SOSwiftVocabulary

/// The most generic kind of creative work, including books, movies, photographs, software programs, etc.
public class SOCreativeWork: SOThing, CreativeWork {
    
    public override class var type: String {
        return "CreativeWork"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return [
            SOArticle.self,
            SOComment.self,
            SOCourse.self,
            SODataCatalog.self,
            SODataset.self,
            SOMap.self,
            SOMediaObject.self,
            SOMusicComposition.self,
            SOMusicPlaylist.self,
            SOMusicRecording.self,
            SOPhotograph.self,
            SOQuestion.self,
            SOReview.self,
            SOSoftwareApplication.self,
            SOWebsite.self
        ]
    }
    
    /// The subject matter of the content.
    public var about: Thing?
    /// The human sensory perceptual system or cognitive faculty through which a person may process or perceive information.
    public var accessMode: AccessMode?
    /// A list of single or combined accessModes that are sufficient to understand all the intellectual content of a resource.
    public var accessModeSufficients: [AccessModeSufficient]?
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
    ///
    public var contentReferenceTime: DateTime?
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
    public var fileFormat: URLOrText?
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    /// Genre of the creative work, broadcast channel or group.
    public var genre: URLOrText?
    /// Indicates a CreativeWork that is (in some sense) a part of this CreativeWork. Inverse property: isPartOf.
    public var part: CreativeWork?
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
    public var basedOn: CreativeWorkOrProductOrURL?
    /// Indicates whether this content is family friendly.
    public var isFamilyFriendly: Bool?
    /// Indicates a CreativeWork that this CreativeWork is (in some sense) part of. Inverse property: hasPart.
    public var partOf: CreativeWork?
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
    public var material: ProductOrURLOrText?
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
    /// A publication event associated with the item.
    public var publication: PublicationEvent?
    /// The publisher of the creative work.
    public var publisher: OrganizationOrPerson?
    /// The publishing division which published the comic.
    public var publisherImprint: Organization?
    /// The publishingPrinciples property indicates (typically via URL) a document describing the editorial principles of an Organization (or individual e.g. a Person writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a CreativeWork (e.g. NewsArticle) the principles are those of the party primarily responsible for the creation of the CreativeWork.
    /// While such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a funder) can be expressed using schema.org terminology.
    public var publishingPrinciples: CreativeWorkOrURL?
    /// The Event where the CreativeWork was recorded. The CreativeWork may capture all or part of the event.
    /// - Inverse property: recordedIn.
    public var recordedAt: Event?
    /// The place and time the release was issued, expressed as a PublicationEvent.
    public var releasedEvent: PublicationEvent?
    /// A review of the item.
    /// - schema.org property name: review
    public var reviews: [Review]?
    /// Indicates (by URL or string) a particular version of a schema used in some CreativeWork. For example, a document could declare a schemaVersion using an URL such as http://schema.org/version/2.0/ if precise indication of schema version was required by some application.
    public var schemaVersion: URLOrText?
    /// The Organization on whose behalf the creator was working.
    public var sourceOrganization: Organization?
    /// The spatialCoverage of a CreativeWork indicates the place(s) which are the focus of the content. It is a subproperty of contentLocation intended primarily for more technical and detailed materials. For example with a Dataset, it indicates areas that the dataset describes: a dataset of New York weather would have spatialCoverage which was the place: the state of New York.
    public var spatialCoverage: Place?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// The temporalCoverage of a CreativeWork indicates the period that the content applies to, i.e. that it describes, either as a DateTime or as a textual string indicating a time period in ISO 8601 time interval format. In the case of a Dataset it will typically indicate the relevant time period in a precise notation (e.g. for a 2011 census dataset, the year 2011 would be written "2011/2012"). Other forms of content e.g. ScholarlyArticle, Book, TVSeries or TVEpisode may indicate their temporalCoverage in broader terms - textually or via well-known URL. Written works such as books may sometimes have precise temporal coverage too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601 interval format format via "1939/1945".
    public var temporalCoverage: DateTimeOrURLOrText?
    /// The textual content of this CreativeWork.
    public var text: String?
    /// A thumbnail image relevant to the Thing.
    public var thumbnailUrl: URL?
    /// Approximate or typical time it takes to work with or through this learning resource for the typical intended target audience, e.g. 'P30M', 'P1H25M'.
    public var timeRequired: Duration?
    /// The work that this work has been translated from. e.g. 物种起源 is a translationOf “On the Origin of Species”
    /// - Inverse property: workTranslation.
    public var translationOfWork: CreativeWork?
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
    /// A work that is a translation of the content of this work. e.g. 西遊記 has an English workTranslation “Journey to the West”,a German workTranslation “Monkeys Pilgerfahrt” and a Vietnamese translation Tây du ký bình khảo.
    /// - Inverse property: translationOfWork.
    public var workTranslation: CreativeWork?
    
    private enum CodingKeys: String, CodingKey {
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
        case recorededAt
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.about = try container.decodeIfPresent(SOThing.self, forKey: .about)
        if let value = try container.decodeIfPresent(String.self, forKey: .accessMode) {
            self.accessMode = AccessMode(rawValue: value)
        }
        if let value = try container.decodeArrayOrElementIfPresent(String.self, forKey: .accessModeSufficients) {
            var accessModeSufficients = [AccessModeSufficient]()
            value.forEach({ (v) in
                if let ams = AccessModeSufficient(rawValue: v) {
                    accessModeSufficients.append(ams)
                }
            })
            self.accessModeSufficients = accessModeSufficients
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .accessibilityAPI) {
            self.accessibilityAPI = AccessibilityAPI(rawValue: value)
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .accessibilityControl) {
            self.accessibilityControl = AccessibilityControl(rawValue: value)
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .accessibilityFeature) {
            self.accessibilityFeature = AccessibilityFeature(rawValue: value)
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .accessibilityHazard) {
            self.accessibilityHazard = AccessibilityHazard(rawValue: value)
        }
        self.accessibilitySummary = try container.decodeIfPresent(String.self, forKey: .accessibilitySummary)
        self.accountablePerson = try container.decodeIfPresent(SOPerson.self, forKey: .accountablePerson)
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.alternativeHeadline = try container.decodeIfPresent(String.self, forKey: .alternativeHeadline)
        self.associatedMedia = try container.decodeIfPresent(SOMediaObject.self, forKey: .associatedMedia)
        self.audience = try container.decodeIfPresent(SOAudience.self, forKey: .audience)
        self.audio = try container.decodeIfPresent(SOAudioObject.self, forKey: .audio)
        self.author = try container.decodeOrganizationOrPersonIfPresent(forKey: .author)
        self.award = try container.decodeIfPresent(String.self, forKey: .award)
        self.character = try container.decodeIfPresent(SOPerson.self, forKey: .character)
        self.citation = try container.decodeCreativeWorkOrTextIfPresent(forKey: .citation)
        self.comment = try container.decodeIfPresent(SOComment.self, forKey: .comment)
        self.commentCount = try container.decodeIfPresent(Int.self, forKey: .commentCount)
        self.contentLocation = try container.decodeIfPresent(SOPlace.self, forKey: .contentLocation)
        self.contentRating = try container.decodeIfPresent(String.self, forKey: .contentRating)
        self.contentReferenceTime = try container.decodeDateTimeIfPresent(forKey: .contentReferenceTime)
        self.contributor = try container.decodeOrganizationOrPersonIfPresent(forKey: .contributor)
        self.copyrightHolder = try container.decodeOrganizationOrPersonIfPresent(forKey: .copyrightHolder)
        self.copyrightYear = try container.decodeIfPresent(Int.self, forKey: .copyrightYear)
        self.creator = try container.decodeOrganizationOrPersonIfPresent(forKey: .creator)
        self.dateCreated = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateCreated)
        self.dateModified = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateModified)
        self.datePublished = try container.decodeDateOnlyIfPresent(forKey: .datePublished)
        self.discussionURL = try container.decodeIfPresent(URL.self, forKey: .discussionURL)
        self.editor = try container.decodeIfPresent(SOPerson.self, forKey: .editor)
        self.educationalAlignment = try container.decodeIfPresent(SOAlignmentObject.self, forKey: .educationalAlignment)
        self.educationalUse = try container.decodeIfPresent(String.self, forKey: .educationalUse)
        self.encoding = try container.decodeIfPresent(SOMediaObject.self, forKey: .encoding)
        self.workExample = try container.decodeIfPresent(SOCreativeWork.self, forKey: .exampleOfWork)
        self.fileFormat = try container.decodeURLOrTextIfPresent(forKey: .fileFormat)
        self.funder = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder)
        self.genre = try container.decodeURLOrTextIfPresent(forKey: .genre)
        self.part = try container.decodeIfPresent(SOCreativeWork.self, forKey: .part)
        self.headline = try container.decodeIfPresent(String.self, forKey: .headline)
        self.inLanguage = try container.decodeLanguageOrTextIfPresent(forKey: .inLanguage)
        self.interactionStatistic = try container.decodeIfPresent(SOInteractionCounter.self, forKey: .interactionStatistic)
        if let value = try container.decodeIfPresent(String.self, forKey: .interactivityType) {
            self.interactivityType = Interactivity(rawValue: value)
        }
        self.isAccessibleForFree = try container.decodeIfPresent(Bool.self, forKey: .isAccessibleForFree)
        self.basedOn = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .basedOn)
        self.isFamilyFriendly = try container.decodeIfPresent(Bool.self, forKey: .isFamilyFriendly)
        self.partOf = try container.decodeIfPresent(SOCreativeWork.self, forKey: .partOf)
        self.keywords = try container.decodeIfPresent(String.self, forKey: .keywords)
        self.learningResourceType = try container.decodeIfPresent(String.self, forKey: .learningResourceType)
        self.license = try container.decodeCreativeWorkOrURLIfPresent(forKey: .license)
        self.locationCreated = try container.decodeIfPresent(SOPlace.self, forKey: .locationCreated)
        self.mainEntity = try container.decodeIfPresent(SOThing.self, forKey: .mainEntity)
        self.material = try container.decodeProductOrURLOrTextIfPresent(forKey: .material)
        self.mentions = try container.decodeIfPresent(SOThing.self, forKey: .mentions)
        self.offers = try container.decodeIfPresent([SOOffer].self, forKey: .offers)
        self.position = try container.decodeIntegerOrTextIfPresent(forKey: .position)
        self.producer = try container.decodeOrganizationOrPersonIfPresent(forKey: .producer)
        self.provider = try container.decodeOrganizationOrPersonIfPresent(forKey: .provider)
        self.publication = try container.decodeIfPresent(SOPublicationEvent.self, forKey: .publication)
        self.publisher = try container.decodeOrganizationOrPersonIfPresent(forKey: .publisher)
        self.publisherImprint = try container.decodeIfPresent(SOOrganization.self, forKey: .publisherImprint)
        self.publishingPrinciples = try container.decodeCreativeWorkOrURLIfPresent(forKey: .publishingPrinciples)
        self.recordedAt = try container.decodeIfPresent(SOEvent.self, forKey: .recorededAt)
        self.releasedEvent = try container.decodeIfPresent(SOPublicationEvent.self, forKey: .releasedEvent)
        self.reviews = try container.decodeArrayOrElementIfPresent(SOReview.self, forKey: .reviews)
        self.schemaVersion = try container.decodeURLOrTextIfPresent(forKey: .schemaVersion)
        self.sourceOrganization = try container.decodeIfPresent(SOOrganization.self, forKey: .sourceOrganization)
        self.spatialCoverage = try container.decodeIfPresent(SOPlace.self, forKey: .spatialCoverage)
        self.sponsor = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor)
        self.temporalCoverage = try container.decodeDateTimeOrURLOrTextIfPresent(forKey: .temporalCoverage)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.timeRequired = try container.decodeDurationIfPresent(forKey: .timeRequired)
        self.translationOfWork = try container.decodeIfPresent(SOCreativeWork.self, forKey: .translationOfWork)
        self.translator = try container.decodeOrganizationOrPersonIfPresent(forKey: .translator)
        self.typicalAgeRange = try container.decodeIfPresent(String.self, forKey: .typicalAgeRange)
        self.version = try container.decodeIntegerOrTextIfPresent(forKey: .version)
        self.video = try container.decodeIfPresent(SOVideoObject.self, forKey: .video)
        self.workExample = try container.decodeIfPresent(SOCreativeWork.self, forKey: .workExample)
        self.workTranslation = try container.decodeIfPresent(SOCreativeWork.self, forKey: .workTranslation)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.about, forKey: .about)
        try container.encodeIfPresent(self.accessMode?.rawValue, forKey: .accessMode)
        if let value = self.accessModeSufficients {
            let values = value.map({ (ams) -> String in
                return ams.rawValue
            })
            try container.encode(values, forKey: .accessModeSufficients)
        }
        try container.encodeIfPresent(self.accessibilityAPI?.rawValue, forKey: .accessibilityAPI)
        try container.encodeIfPresent(self.accessibilityControl?.rawValue, forKey: .accessibilityControl)
        try container.encodeIfPresent(self.accessibilityFeature?.rawValue, forKey: .accessibilityFeature)
        try container.encodeIfPresent(self.accessibilityHazard?.rawValue, forKey: .accessibilityHazard)
        try container.encodeIfPresent(self.accessibilitySummary, forKey: .accessibilitySummary)
        try container.encodeIfPresent(self.accountablePerson, forKey: .accountablePerson)
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.alternativeHeadline, forKey: .alternativeHeadline)
        try container.encodeIfPresent(self.associatedMedia, forKey: .associatedMedia)
        try container.encodeIfPresent(self.audience, forKey: .audience)
        try container.encodeIfPresent(self.audio, forKey: .audio)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.award, forKey: .award)
        try container.encodeIfPresent(self.character, forKey: .character)
        try container.encodeIfPresent(self.citation, forKey: .citation)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encodeIfPresent(self.commentCount, forKey: .commentCount)
        try container.encodeIfPresent(self.contentLocation, forKey: .contentLocation)
        try container.encodeIfPresent(self.contentRating, forKey: .contentRating)
        try container.encodeIfPresent(self.contentReferenceTime, forKey: .contentReferenceTime)
        try container.encodeIfPresent(self.contributor, forKey: .contributor)
        try container.encodeIfPresent(self.copyrightHolder, forKey: .copyrightHolder)
        try container.encodeIfPresent(self.copyrightYear, forKey: .copyrightYear)
        try container.encodeIfPresent(self.creator, forKey: .creator)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.dateModified, forKey: .dateModified)
        try container.encodeIfPresent(self.datePublished, forKey: .datePublished)
        try container.encodeIfPresent(self.discussionURL, forKey: .discussionURL)
        try container.encodeIfPresent(self.editor, forKey: .editor)
        try container.encodeIfPresent(self.educationalAlignment, forKey: .educationalAlignment)
        try container.encodeIfPresent(self.educationalUse, forKey: .educationalUse)
        try container.encodeIfPresent(self.encoding, forKey: .encoding)
        try container.encodeIfPresent(self.exampleOfWork, forKey: .exampleOfWork)
        try container.encodeIfPresent(self.fileFormat, forKey: .fileFormat)
        try container.encodeIfPresent(self.funder, forKey: .funder)
        try container.encodeIfPresent(self.genre, forKey: .genre)
        try container.encodeIfPresent(self.part, forKey: .part)
        try container.encodeIfPresent(self.headline, forKey: .headline)
        try container.encodeIfPresent(self.inLanguage, forKey: .inLanguage)
        try container.encodeIfPresent(self.interactionStatistic, forKey: .interactionStatistic)
        try container.encodeIfPresent(self.interactivityType?.rawValue, forKey: .interactivityType)
        try container.encodeIfPresent(self.isAccessibleForFree, forKey: .isAccessibleForFree)
        try container.encodeIfPresent(self.basedOn, forKey: .basedOn)
        try container.encodeIfPresent(self.isFamilyFriendly, forKey: .isFamilyFriendly)
        try container.encodeIfPresent(self.partOf, forKey: .partOf)
        try container.encodeIfPresent(self.keywords, forKey: .keywords)
        try container.encodeIfPresent(self.learningResourceType, forKey: .learningResourceType)
        try container.encodeIfPresent(self.license, forKey: .license)
        try container.encodeIfPresent(self.locationCreated, forKey: .locationCreated)
        try container.encodeIfPresent(self.mainEntity, forKey: .mainEntity)
        try container.encodeIfPresent(self.material, forKey: .material)
        try container.encodeIfPresent(self.mentions, forKey: .mentions)
        try container.encodeIfPresent(self.offers, forKey: .offers)
        try container.encodeIfPresent(self.position, forKey: .position)
        try container.encodeIfPresent(self.producer, forKey: .producer)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.publication, forKey: .publication)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.publisherImprint, forKey: .publisherImprint)
        try container.encodeIfPresent(self.publishingPrinciples, forKey: .publishingPrinciples)
        try container.encodeIfPresent(self.recordedAt, forKey: .recorededAt)
        try container.encodeIfPresent(self.releasedEvent, forKey: .releasedEvent)
        try container.encodeIfPresent(self.reviews, forKey: .reviews)
        try container.encodeIfPresent(self.schemaVersion, forKey: .schemaVersion)
        try container.encodeIfPresent(self.sourceOrganization, forKey: .sourceOrganization)
        try container.encodeIfPresent(self.spatialCoverage, forKey: .spatialCoverage)
        try container.encodeIfPresent(self.sponsor, forKey: .sponsor)
        try container.encodeIfPresent(self.temporalCoverage, forKey: .temporalCoverage)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.thumbnailUrl, forKey: .thumbnailUrl)
        try container.encodeIfPresent(self.timeRequired, forKey: .timeRequired)
        try container.encodeIfPresent(self.translationOfWork, forKey: .translationOfWork)
        try container.encodeIfPresent(self.translator, forKey: .translator)
        try container.encodeIfPresent(self.typicalAgeRange, forKey: .typicalAgeRange)
        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.video, forKey: .video)
        try container.encodeIfPresent(self.workExample, forKey: .workExample)
        try container.encodeIfPresent(self.workTranslation, forKey: .workTranslation)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: CreativeWork?, forKey key: K) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        }
    }
}
