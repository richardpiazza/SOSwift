import Foundation
import SOSwiftVocabulary

/// The most generic kind of creative work, including books, movies, photographs, software programs, etc.
public class SOCreativeWork: SOThing, CreativeWork {
    
    public override class var type: String {
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
    public var thumbnailUrl: URL?
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
    
    private enum CodingKeys: String, CodingKey {
        case about
        case accessMode
        case accessModeSufficient
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
        case hasPart
        case headline
        case inLanguage
        case interactionStatistic
        case interactivityType
        case isAccessibleForFree
        case isBasedOn
        case isFamilyFriendly
        case isPartOf
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
        case releasedEvent
        case review
        case schemaVersion
        case sourceOrganization
        case spatialCoverage
        case sponsor
        case temporalCoverage
        case text
        case thumbnailUrl
        case timeRequired
        case translator
        case typicalAgeRange
        case version
        case video
        case workExample
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .about) {
            self.about = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .accessMode) {
            self.accessMode = AccessMode(rawValue: value)
        }
        if let value = try container.decodeIfPresent([String].self, forKey: .accessModeSufficient) {
            var accessModeSufficients = [AccessModeSufficient]()
            value.forEach({ (v) in
                if let ams = AccessModeSufficient(rawValue: v) {
                    accessModeSufficients.append(ams)
                }
            })
            self.accessModeSufficient = accessModeSufficients
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
        if let value = try container.decodeIfPresent(String.self, forKey: .accessibilitySummary) {
            self.accessibilitySummary = value
        }
        if let value = try container.decodeIfPresent(SOPerson.self, forKey: .accountablePerson) {
            self.accountablePerson = value
        }
        if let value = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating) {
            self.aggregateRating = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .alternativeHeadline) {
            self.alternativeHeadline = value
        }
        if let value = try container.decodeIfPresent(SOMediaObject.self, forKey: .associatedMedia) {
            self.associatedMedia = value
        }
        if let value = try container.decodeIfPresent(SOAudience.self, forKey: .audience) {
            self.audience = value
        }
        if let value = try container.decodeIfPresent(SOAudioObject.self, forKey: .audio) {
            self.audio = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .author) {
            self.author = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .award) {
            self.award = value
        }
        if let value = try container.decodeIfPresent(SOPerson.self, forKey: .character) {
            self.character = value
        }
        if let value = try container.decodeCreativeWorkOrTextIfPresent(forKey: .citation) {
            self.citation = value
        }
        if let value = try container.decodeIfPresent(SOComment.self, forKey: .comment) {
            self.comment = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .commentCount) {
            self.commentCount = value
        }
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .contentLocation) {
            self.contentLocation = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .contentRating) {
            self.contentRating = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .contributor) {
            self.contributor = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .copyrightHolder) {
            self.copyrightHolder = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .copyrightYear) {
            self.copyrightYear = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .creator) {
            self.creator = value
        }
        self.dateCreated = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateCreated)
        self.dateModified = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateModified)
        self.datePublished = try container.decodeDateOnlyIfPresent(forKey: .datePublished)
        if let value = try container.decodeIfPresent(URL.self, forKey: .discussionURL) {
            self.discussionURL = value
        }
        if let value = try container.decodeIfPresent(SOPerson.self, forKey: .editor) {
            self.editor = value
        }
        if let value = try container.decodeIfPresent(SOAlignmentObject.self, forKey: .educationalAlignment) {
            self.educationalAlignment = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .educationalUse) {
            self.educationalUse = value
        }
        if let value = try container.decodeIfPresent(SOMediaObject.self, forKey: .encoding) {
            self.encoding = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .exampleOfWork) {
            self.workExample = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .fileFormat) {
            self.fileFormat = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder) {
            self.funder = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .genre) {
            self.genre = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .hasPart) {
            self.hasPart = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .headline) {
            self.headline = value
        }
        if let value = try container.decodeLanguageOrTextIfPresent(forKey: .inLanguage) {
            self.inLanguage = value
        }
        if let value = try container.decodeIfPresent(SOInteractionCounter.self, forKey: .interactionStatistic) {
            self.interactionStatistic = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .interactivityType) {
            self.interactivityType = Interactivity(rawValue: value)
        }
        if let value = try container.decodeIfPresent(Bool.self, forKey: .isAccessibleForFree) {
            self.isAccessibleForFree = value
        }
        if let value = try container.decodeCreativeWorkOrProductOrURLIfPresent(forKey: .isBasedOn) {
            self.isBasedOn = value
        }
        if let value = try container.decodeIfPresent(Bool.self, forKey: .isFamilyFriendly) {
            self.isFamilyFriendly = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .isPartOf) {
            self.isPartOf = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .keywords) {
            self.keywords = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .learningResourceType) {
            self.learningResourceType = value
        }
        if let value = try container.decodeCreativeWorkOrURLIfPresent(forKey: .license) {
            self.license = value
        }
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .locationCreated) {
            self.locationCreated = value
        }
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .mainEntity) {
            self.mainEntity = value
        }
        if let value = try container.decodeProductOrTextOrURLIfPresent(forKey: .material) {
            self.material = value
        }
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .mentions) {
            self.mentions = value
        }
        if let value = try container.decodeIfPresent([SOOffer].self, forKey: .offers) {
            self.offers = value
        }
        if let value = try container.decodeIntegerOrTextIfPresent(forKey: .position) {
            self.position = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .producer) {
            self.producer = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .provider) {
            self.provider = value
        }
        if let value = try container.decodeIfPresent(SOPublicationEvent.self, forKey: .releasedEvent) {
            self.releasedEvent = value
        }
        if let value = try container.decodeIfPresent(SOReview.self, forKey: .review) {
            self.review = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .schemaVersion) {
            self.schemaVersion = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .sourceOrganization) {
            self.sourceOrganization = value
        }
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .spatialCoverage) {
            self.spatialCoverage = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor) {
            self.sponsor = value
        }
        if let value = try container.decodeDateTimeOrTextOrURLIfPresent(forKey: .temporalCoverage) {
            self.temporalCoverage = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .text) {
            self.text = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .timeRequired) {
            self.timeRequired = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .translator) {
            self.translator = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .typicalAgeRange) {
            self.typicalAgeRange = value
        }
        if let value = try container.decodeIntegerOrTextIfPresent(forKey: .version) {
            self.version = value
        }
        if let value = try container.decodeIfPresent(SOVideoObject.self, forKey: .video) {
            self.video = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .workExample) {
            self.workExample = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.about as? SOThing {
            try container.encode(value, forKey: .about)
        }
        if let value = self.accessMode {
            try container.encode(value.rawValue, forKey: .accessMode)
        }
        if let value = self.accessModeSufficient {
            let values = value.map({ (ams) -> String in
                return ams.rawValue
            })
            try container.encode(values, forKey: .accessModeSufficient)
        }
        if let value = self.accessibilityAPI {
            try container.encode(value.rawValue, forKey: .accessibilityAPI)
        }
        if let value = self.accessibilityControl {
            try container.encode(value.rawValue, forKey: .accessibilityControl)
        }
        if let value = self.accessibilityFeature {
            try container.encode(value.rawValue, forKey: .accessibilityFeature)
        }
        if let value = self.accessibilityHazard {
            try container.encode(value.rawValue, forKey: .accessibilityHazard)
        }
        if let value = self.accessibilitySummary {
            try container.encode(value, forKey: .accessibilitySummary)
        }
        if let value = self.accountablePerson as? SOPerson {
            try container.encode(value, forKey: .accountablePerson)
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            try container.encode(value, forKey: .aggregateRating)
        }
        if let value = self.alternativeHeadline {
            try container.encode(value, forKey: .alternativeHeadline)
        }
        if let value = self.associatedMedia as? SOMediaObject {
            try container.encode(value, forKey: .associatedMedia)
        }
        if let value = self.audience as? SOAudience {
            try container.encode(value, forKey: .audience)
        }
        if let value = self.audio as? SOAudioObject {
            try container.encode(value, forKey: .audio)
        }
        try container.encodeIfPresent(self.author, forKey: .author)
        if let value = self.award {
            try container.encode(value, forKey: .award)
        }
        if let value = self.character as? SOPerson {
            try container.encode(value, forKey: .character)
        }
        try container.encodeIfPresent(self.citation, forKey: .citation)
        if let value = self.comment as? SOComment {
            try container.encode(value, forKey: .comment)
        }
        if let value = self.commentCount {
            try container.encode(value, forKey: .commentCount)
        }
        if let value = self.contentLocation as? SOPlace {
            try container.encode(value, forKey: .contentLocation)
        }
        if let value = self.contentRating {
            try container.encode(value, forKey: .contentRating)
        }
        try container.encodeIfPresent(self.contributor, forKey: .contributor)
        try container.encodeIfPresent(self.copyrightHolder, forKey: .copyrightHolder)
        if let value = self.copyrightYear {
            try container.encode(value, forKey: .copyrightYear)
        }
        try container.encodeIfPresent(self.creator, forKey: .creator)
        if let value = self.dateCreated as? String {
            try container.encode(value, forKey: .dateCreated)
        }
        if let value = self.dateModified as? String {
            try container.encode(value, forKey: .dateModified)
        }
        try container.encodeIfPresent(self.datePublished, forKey: .datePublished)
        if let value = self.discussionURL {
            try container.encode(value, forKey: .discussionURL)
        }
        if let value = self.editor as? SOPerson {
            try container.encode(value, forKey: .editor)
        }
        if let value = self.educationalAlignment as? SOAlignmentObject {
            try container.encode(value, forKey: .educationalAlignment)
        }
        if let value = self.educationalUse {
            try container.encode(value, forKey: .educationalUse)
        }
        if let value = self.encoding as? SOMediaObject {
            try container.encode(value, forKey: .encoding)
        }
        if let value = self.exampleOfWork as? SOCreativeWork {
            try container.encode(value, forKey: .exampleOfWork)
        }
        try container.encodeIfPresent(self.fileFormat, forKey: .fileFormat)
        try container.encodeIfPresent(self.funder, forKey: .funder)
        try container.encodeIfPresent(self.genre, forKey: .genre)
        if let value = self.hasPart as? SOCreativeWork {
            try container.encode(value, forKey: .hasPart)
        }
        if let value = self.headline {
            try container.encode(value, forKey: .headline)
        }
        try container.encodeIfPresent(self.inLanguage, forKey: .inLanguage)
        if let value = self.interactionStatistic as? SOInteractionCounter {
            try container.encode(value, forKey: .interactionStatistic)
        }
        if let value = self.interactivityType {
            try container.encode(value.rawValue, forKey: .interactivityType)
        }
        if let value = self.isAccessibleForFree {
            try container.encode(value, forKey: .isAccessibleForFree)
        }
        try container.encodeIfPresent(self.isBasedOn, forKey: .isBasedOn)
        if let value = self.isFamilyFriendly {
            try container.encode(value, forKey: .isFamilyFriendly)
        }
        if let value = self.isPartOf as? SOCreativeWork {
            try container.encode(value, forKey: .isPartOf)
        }
        if let value = self.keywords {
            try container.encode(value, forKey: .keywords)
        }
        if let value = self.learningResourceType {
            try container.encode(value, forKey: .learningResourceType)
        }
        try container.encodeIfPresent(self.license, forKey: .license)
        if let value = self.locationCreated as? SOPlace {
            try container.encode(value, forKey: .locationCreated)
        }
        if let value = self.mainEntity as? SOThing {
            try container.encode(value, forKey: .mainEntity)
        }
        try container.encodeIfPresent(self.material, forKey: .material)
        if let value = self.mentions as? SOThing {
            try container.encode(value, forKey: .mentions)
        }
        if let value = self.offers as? [SOOffer] {
            try container.encode(value, forKey: .offers)
        }
        try container.encodeIfPresent(self.position, forKey: .position)
        try container.encodeIfPresent(self.producer, forKey: .producer)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        if let value = self.releasedEvent as? SOPublicationEvent {
            try container.encode(value, forKey: .releasedEvent)
        }
        if let value = self.review as? SOReview {
            try container.encode(value, forKey: .review)
        }
        try container.encodeIfPresent(self.schemaVersion, forKey: .schemaVersion)
        if let value = self.sourceOrganization as? SOOrganization {
            try container.encode(value, forKey: .sourceOrganization)
        }
        if let value = self.spatialCoverage as? SOPlace {
            try container.encode(value, forKey: .spatialCoverage)
        }
        try container.encodeIfPresent(self.sponsor, forKey: .sponsor)
        try container.encodeIfPresent(self.temporalCoverage, forKey: .temporalCoverage)
        if let value = self.text {
            try container.encode(value, forKey: .text)
        }
        if let value = self.thumbnailUrl {
            try container.encode(value, forKey: .thumbnailUrl)
        }
        if let value = self.timeRequired as? String {
            try container.encode(value, forKey: .timeRequired)
        }
        try container.encodeIfPresent(self.translator, forKey: .translator)
        if let value = self.typicalAgeRange {
            try container.encode(value, forKey: .typicalAgeRange)
        }
        try container.encodeIfPresent(self.version, forKey: .version)
        if let value = self.video as? SOVideoObject {
            try container.encode(value, forKey: .video)
        }
        if let value = self.workExample as? SOCreativeWork {
            try container.encode(value, forKey: .workExample)
        }
        
        try super.encode(to: encoder)
    }
}
