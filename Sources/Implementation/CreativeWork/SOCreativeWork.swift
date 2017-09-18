import Foundation

/// The most generic kind of creative work, including books, movies, photographs, software programs, etc.
public class SOCreativeWork: SOThing, CreativeWork {
    public struct Keys {
        public static let about = "about"
        public static let accessMode = "accessMode"
        public static let accessModeSufficient = "accessModeSufficient"
        public static let accessibilityAPI = "accessibilityAPI"
        public static let accessibilityControl = "accessibilityControl"
        public static let accessibilityFeature = "accessibilityFeature"
        public static let accessibilityHazard = "accessibilityHazard"
        public static let accessibilitySummary = "accessibilitySummary"
        public static let accountablePerson = "accountablePerson"
        public static let aggregateRating = "aggregateRating"
        public static let alternativeHeadline = "alternativeHeadline"
        public static let associatedMedia = "associatedMedia"
        public static let audience = "audience"
        public static let audio = "audio"
        public static let author = "author"
        public static let award = "award"
        public static let character = "character"
        public static let citation = "citation"
        public static let comment = "comment"
        public static let commentCount = "commentCount"
        public static let contentLocation = "contentLocation"
        public static let contentRating = "contenttRating"
        public static let contributor = "contributor"
        public static let copyrightHolder = "copyrightHolder"
        public static let copyrightYear = "copyrightYear"
        public static let creator = "creator"
        public static let dateCreaated = "dateCreated"
        public static let dateModified = "dateModified"
        public static let datePublished = "datePublished"
        public static let discussionUrl = "discussionUrl"
        public static let editor = "editor"
        public static let educationalAlignment = "educationaalAlignment"
        public static let educationalUse = "educationalUse"
        public static let encoding = "encoding"
        public static let exampleOfWork = "exampleOfWork"
        public static let fileFormat = "fileFormat"
        public static let funder = "funder"
        public static let genre = "genre"
        public static let hasPart = "hasPart"
        public static let headline = "headline"
        public static let inLanguage = "inLaungage"
        public static let interactionStatistic = "interactionStatistic"
        public static let interactivityType = "interactivityType"
        public static let isAccessibleForFree = "isAccessibleForFree"
        public static let isBasedOn = "isBasedOn"
        public static let isFamilyFriendly = "isFamilyFriendly"
        public static let isPartOf = "isPartOf"
        public static let keywords = "keywords"
        public static let learningResourceType = "learningResourceType"
        public static let license = "license"
        public static let locationCreated = "locationCreated"
        public static let mainEntity = "mainEntity"
        public static let material = "material"
        public static let mentions = "mentions"
        public static let offers = "offers"
        public static let position = "position"
        public static let producer = "producer"
        public static let provider = "provider"
        public static let publication = "publication"
        public static let publisher = "publisher"
        public static let publishingPriciples = "publishingPrinciples"
        public static let recordedAt = "recordedAt"
        public static let releasedEvent = "releasedEvent"
        public static let review = "review"
        public static let schemaVersion = "schemaVersion"
        public static let sourceOrganization = "sourceOrganization"
        public static let spatialCoverage = "spatialCoverage"
        public static let sponsor = "sponsor"
        public static let temporalCoverage = "temporalCoverage"
        public static let text = "text"
        public static let thumbnailUrl = "thumbnailUrl"
        public static let timeRequired = "timeRequired"
        public static let translator = "translator"
        public static let typicalAgeRange = "typicalAgeRange"
        public static let version = "version"
        public static let video = "video"
        public static let workExample = "workExample"
    }
    
    override public class var type: String {
        return "CreativeWork"
    }
    
    override public class var specificTypes: [MakeableThing.Type] {
        return [SOAudioObject.self, SOImageObject.self, SOVideoObject.self]
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.about] as? [String : AnyObject] {
            self.about = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.accessMode] as? String {
            self.accessMode = AccessMode(rawValue: value)
        }
        if let value = dictionary[Keys.accessModeSufficient] {
            self.accessModeSufficient = []
            if let typedValue = value as? [String] {
                for element in typedValue {
                    if let item = AccessModeSufficient(rawValue: element) {
                        self.accessModeSufficient?.append(item)
                    }
                }
            } else if let typedValue = value as? String {
                if let item = AccessModeSufficient(rawValue: typedValue) {
                    self.accessModeSufficient?.append(item)
                }
            }
            
        }
        if let value = dictionary[Keys.accessibilityAPI] as? String {
            self.accessibilityAPI = AccessibilityAPI(rawValue: value)
        }
        if let value = dictionary[Keys.accessibilityFeature] as? String {
            self.accessibilityFeature = AccessibilityFeature(rawValue: value)
        }
        if let value = dictionary[Keys.accessibilityHazard] as? String {
            self.accessibilityHazard = AccessibilityHazard(rawValue: value)
        }
        if let value = dictionary[Keys.accessibilitySummary] as? String {
            self.accessibilitySummary = value
        }
        if let value = dictionary[Keys.accountablePerson] as? [String : AnyObject] {
            self.accountablePerson = SOPerson(dictionary: value)
        }
        if let value = dictionary[Keys.aggregateRating] as? [String : AnyObject] {
            self.aggregateRating = SOAggregateRating(dictionary: value)
        }
        if let value = dictionary[Keys.alternativeHeadline] as? String {
            self.alternativeHeadline = value
        }
        if let value = dictionary[Keys.associatedMedia] as? [String : AnyObject] {
            self.associatedMedia = SOMediaObject(dictionary: value)
        }
        if let value = dictionary[Keys.audience] as? [String : AnyObject] {
            self.audience = SOAudience(dictionary: value)
        }
        if let value = dictionary[Keys.audio] as? [String : AnyObject] {
            self.audio = SOAudioObject(dictionary: value)
        }
        if let value = dictionary[Keys.author] as? [String : AnyObject] {
            self.author = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.award] as? String {
            self.award = value
        }
        if let value = dictionary[Keys.character] as? [String : AnyObject] {
            self.character = SOPerson(dictionary: value)
        }
        if let value = dictionary[Keys.citation] {
            self.citation = makeCreativeWorkOrText(anyObject: value)
        }
        if let value = dictionary[Keys.comment] as? [String : AnyObject] {
            self.comment = SOComment(dictionary: value)
        }
        if let value = dictionary[Keys.commentCount] as? Int {
            self.commentCount = value
        }
        if let value = dictionary[Keys.contentLocation] as? [String : AnyObject] {
            self.contentLocation = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.contentRating] as? String {
            self.contentRating = value
        }
        if let value = dictionary[Keys.contributor] as? [String : AnyObject] {
            self.contributor = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.copyrightHolder] as? [String : AnyObject] {
            self.copyrightHolder = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.copyrightYear] as? Int {
            self.copyrightYear = value
        }
        if let value = dictionary[Keys.creator] as? [String : AnyObject] {
            self.creator = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.dateCreaated] as? String {
            self.dateCreated = value
        }
        if let value = dictionary[Keys.dateModified] as? String {
            self.dateModified = value
        }
        if let value = dictionary[Keys.datePublished] as? String {
            self.datePublished = value
        }
        if let value = dictionary[Keys.discussionUrl] as? String {
            self.discussionURL = URL(string: value)
        }
        if let value = dictionary[Keys.editor] as? [String : AnyObject] {
            self.editor = SOPerson(dictionary: value)
        }
        if let value = dictionary[Keys.educationalAlignment] as? [String : AnyObject] {
            self.educationalAlignment = SOAlignmentObject(dictionary: value)
        }
        if let value = dictionary[Keys.educationalUse] as? String {
            self.educationalUse = value
        }
        if let value = dictionary[Keys.encoding] as? [String : AnyObject] {
            self.encoding = SOMediaObject(dictionary: value)
        }
        if let value = dictionary[Keys.exampleOfWork] as? [String : AnyObject] {
            self.exampleOfWork = SOCreativeWork(dictionary: value)
        }
        if let value = dictionary[Keys.fileFormat] {
            self.fileFormat = makeTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.funder] as? [String : AnyObject] {
            self.funder = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.genre] {
            self.genre = makeTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.hasPart] as? [String : AnyObject] {
            self.hasPart = SOCreativeWork(dictionary: value)
        }
        if let value = dictionary[Keys.headline] as? String {
            self.headline = value
        }
        if let value = dictionary[Keys.inLanguage] {
            self.inLanguage = makeLanguageOrText(anyObject: value)
        }
        if let value = dictionary[Keys.interactionStatistic] as? [String : AnyObject] {
            self.interactionStatistic = SOInteractionCounter(dictionary: value)
        }
        if let value = dictionary[Keys.interactivityType] as? String {
            self.interactivityType = Interactivity(rawValue: value)
        }
        if let value = dictionary[Keys.isAccessibleForFree] as? Bool {
            self.isAccessibleForFree = value
        }
        if let value = dictionary[Keys.isBasedOn] {
            self.isBasedOn = makeCreativeWorkOrProductOrText(anyObject: value)
        }
        if let value = dictionary[Keys.isFamilyFriendly] as? Bool {
            self.isFamilyFriendly = value
        }
        if let value = dictionary[Keys.isPartOf] as? [String : AnyObject] {
            self.isPartOf = SOCreativeWork(dictionary: value)
        }
        if let value = dictionary[Keys.keywords] as? String {
            self.keywords = value
        }
        if let value = dictionary[Keys.learningResourceType] as? String {
            self.learningResourceType = value
        }
        if let value = dictionary[Keys.license] {
            self.license = makeCreativeWorkOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.locationCreated] as? [String : AnyObject] {
            self.locationCreated = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.mainEntity] as? [String : AnyObject] {
            self.mainEntity = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.material] {
            self.material = makeProductOrTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.mentions] as? [String : AnyObject] {
            self.mentions = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.offers] {
            self.offers = makeOffers(anyObject: value)
        }
        if let value = dictionary[Keys.position] {
            self.position = makeIntegerOrText(anyObject: value)
        }
        if let value = dictionary[Keys.producer] as? [String : AnyObject] {
            self.producer = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.provider] as? [String : AnyObject] {
            self.provider = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.releasedEvent] as? [String : AnyObject] {
            self.releasedEvent = SOPublicationEvent(dictionary: value)
        }
        if let value = dictionary[Keys.review] as? [String : AnyObject] {
            self.review = SOReview(dictionary: value)
        }
        if let value = dictionary[Keys.schemaVersion] {
            self.schemaVersion = makeTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.sourceOrganization] as? [String : AnyObject] {
            self.sourceOrganization = SOOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.spatialCoverage] as? [String : AnyObject] {
            self.spatialCoverage = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.sponsor] as? [String : AnyObject] {
            self.sponsor = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.temporalCoverage] {
            self.temporalCoverage = makeDateTimeOrTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.text] as? String {
            self.text = value
        }
        if let value = dictionary[Keys.thumbnailUrl] as? String {
            self.thumbnailUrl = URL(string: value)
        }
        if let value = dictionary[Keys.timeRequired] as? String {
            self.timeRequired = value
        }
        if let value = dictionary[Keys.translator] as? [String : AnyObject] {
            self.translator = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.typicalAgeRange] as? String {
            self.typicalAgeRange = value
        }
        if let value = dictionary[Keys.version] {
            self.version = makeIntegerOrText(anyObject: value)
        }
        if let value = dictionary[Keys.video] as? [String : AnyObject] {
            self.video = SOVideoObject(dictionary: value)
        }
        if let value = dictionary[Keys.workExample] as? [String : AnyObject] {
            self.workExample = SOCreativeWork(dictionary: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.about as? SOThing {
            dictionary[Keys.about] = value.dictionary as AnyObject
        }
        if let value = self.accessMode {
            dictionary[Keys.accessMode] = value.rawValue as AnyObject
        }
        if let value = self.accessModeSufficient {
            var values = [String]()
            for element in value {
                values.append(element.rawValue)
            }
            dictionary[Keys.accessModeSufficient] = values as AnyObject
        }
        if let value = self.accessibilityAPI {
            dictionary[Keys.accessibilityAPI] = value.rawValue as AnyObject
        }
        if let value = self.accessibilityControl {
            dictionary[Keys.accessibilityControl] = value.rawValue as AnyObject
        }
        if let value = self.accessibilityFeature {
            dictionary[Keys.accessibilityFeature] = value.rawValue as AnyObject
        }
        if let value = self.accessibilityHazard {
            dictionary[Keys.accessibilityHazard] = value.rawValue as AnyObject
        }
        if let value = self.accessibilitySummary {
            dictionary[Keys.accessibilitySummary] = value as AnyObject
        }
        if let value = self.accountablePerson as? SOPerson {
            dictionary[Keys.accountablePerson] = value.dictionary as AnyObject
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            dictionary[Keys.aggregateRating] = value.dictionary as AnyObject
        }
        if let value = self.alternativeHeadline {
            dictionary[Keys.alternativeHeadline] = value as AnyObject
        }
        if let value = self.associatedMedia as? SOMediaObject {
            dictionary[Keys.associatedMedia] = value.dictionary as AnyObject
        }
        if let value = self.audience as? SOAudience {
            dictionary[Keys.audience] = value.dictionary as AnyObject
        }
        if let value = self.audio as? SOAudioObject {
            dictionary[Keys.audio] = value.dictionary as AnyObject
        }
        if let value = self.author?.dictionaryValue {
            dictionary[Keys.author] = value
        }
        if let value = self.award {
            dictionary[Keys.award] = value as AnyObject
        }
        if let value = self.character as? SOPerson {
            dictionary[Keys.character] = value.dictionary as AnyObject
        }
        if let value = self.citation?.dictionaryValue {
            dictionary[Keys.citation] = value
        }
        if let value = self.comment as? SOComment {
            dictionary[Keys.comment] = value.dictionary as AnyObject
        }
        if let value = self.commentCount {
            dictionary[Keys.commentCount] = value as AnyObject
        }
        if let value = self.contentLocation as? SOPlace {
            dictionary[Keys.contentLocation] = value.dictionary as AnyObject
        }
        if let value = self.contentRating {
            dictionary[Keys.contentRating] = value as AnyObject
        }
        if let value = self.contributor?.dictionaryValue {
            dictionary[Keys.contributor] = value
        }
        if let value = self.copyrightHolder?.dictionaryValue {
            dictionary[Keys.copyrightHolder] = value
        }
        if let value = self.copyrightYear {
            dictionary[Keys.copyrightYear] = value as AnyObject
        }
        if let value = self.creator?.dictionaryValue {
            dictionary[Keys.creator] = value
        }
        if let value = self.dateCreated as? String {
            dictionary[Keys.dateCreaated] = value as AnyObject
        }
        if let value = self.dateModified as? String {
            dictionary[Keys.dateModified] = value as AnyObject
        }
        if let value = self.datePublished as? String {
            dictionary[Keys.datePublished] = value as AnyObject
        }
        if let value = self.discussionURL {
            dictionary[Keys.discussionUrl] = value.absoluteString as AnyObject
        }
        if let value = self.editor as? SOPerson {
            dictionary[Keys.editor] = value.dictionary as AnyObject
        }
        if let value = self.educationalAlignment as? SOAlignmentObject {
            dictionary[Keys.educationalAlignment] = value.dictionary as AnyObject
        }
        if let value = self.educationalUse {
            dictionary[Keys.educationalUse] = value as AnyObject
        }
        if let value = self.encoding as? SOMediaObject {
            dictionary[Keys.encoding] = value.dictionary as AnyObject
        }
        if let value = self.exampleOfWork as? SOCreativeWork {
            dictionary[Keys.exampleOfWork] = value.dictionary as AnyObject
        }
        if let value = self.fileFormat?.dictionaryValue {
            dictionary[Keys.fileFormat] = value
        }
        if let value = self.funder?.dictionaryValue {
            dictionary[Keys.funder] = value
        }
        if let value = self.genre?.dictionaryValue {
            dictionary[Keys.genre] = value
        }
        if let value = self.hasPart as? SOCreativeWork {
            dictionary[Keys.hasPart] = value.dictionary as AnyObject
        }
        if let value = self.headline {
            dictionary[Keys.headline] = value as AnyObject
        }
        if let value = self.inLanguage?.dictionaryValue {
            dictionary[Keys.inLanguage] = value
        }
        if let value = self.interactionStatistic as? SOInteractionCounter {
            dictionary[Keys.inLanguage] = value.dictionary as AnyObject
        }
        if let value = self.interactivityType {
            dictionary[Keys.interactivityType] = value.rawValue as AnyObject
        }
        if let value = self.isAccessibleForFree {
            dictionary[Keys.isAccessibleForFree] = value as AnyObject
        }
        if let value = self.isBasedOn?.dictionaryValue {
            dictionary[Keys.isBasedOn] = value
        }
        if let value = self.isFamilyFriendly {
            dictionary[Keys.isFamilyFriendly] = value as AnyObject
        }
        if let value = self.isPartOf as? SOCreativeWork {
            dictionary[Keys.isPartOf] = value.dictionary as AnyObject
        }
        if let value = self.keywords {
            dictionary[Keys.keywords] = value as AnyObject
        }
        if let value = self.learningResourceType {
            dictionary[Keys.learningResourceType] = value as AnyObject
        }
        if let value = self.license?.dictionaryValue {
            dictionary[Keys.license] = value
        }
        if let value = self.locationCreated as? SOPlace {
            dictionary[Keys.locationCreated] = value.dictionary as AnyObject
        }
        if let value = self.mainEntity as? SOThing {
            dictionary[Keys.mainEntity] = value.dictionary as AnyObject
        }
        if let value = self.material?.dictionaryValue {
            dictionary[Keys.material] = value
        }
        if let value = self.mentions as? SOThing {
            dictionary[Keys.mentions] = value.dictionary as AnyObject
        }
        if let value = self.offers as? [SOOffer] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.offers] = values as AnyObject
        }
        if let value = self.position?.dictionaryValue {
            dictionary[Keys.position] = value
        }
        if let value = self.producer?.dictionaryValue {
            dictionary[Keys.producer] = value
        }
        if let value = self.provider?.dictionaryValue {
            dictionary[Keys.provider] = value
        }
        if let value = self.releasedEvent as? SOPublicationEvent {
            dictionary[Keys.releasedEvent] = value.dictionary as AnyObject
        }
        if let value = self.review as? SOReview {
            dictionary[Keys.review] = value.dictionary as AnyObject
        }
        if let value = self.schemaVersion?.dictionaryValue {
            dictionary[Keys.schemaVersion] = value
        }
        if let value = self.temporalCoverage as? String {
            dictionary[Keys.temporalCoverage] = value as AnyObject
        }
        if let value = self.text {
            dictionary[Keys.text] = value as AnyObject
        }
        if let value = self.thumbnailUrl {
            dictionary[Keys.thumbnailUrl] = value.absoluteString as AnyObject
        }
        if let value = self.timeRequired as? String {
            dictionary[Keys.timeRequired] = value as AnyObject
        }
        if let value = self.translator?.dictionaryValue {
            dictionary[Keys.translator] = value
        }
        if let value = self.typicalAgeRange {
            dictionary[Keys.typicalAgeRange] = value as AnyObject
        }
        if let value = self.version?.dictionaryValue {
            dictionary[Keys.version] = value
        }
        if let value = self.video as? SOVideoObject {
            dictionary[Keys.video] = value.dictionary as AnyObject
        }
        if let value = self.workExample as? SOCreativeWork {
            dictionary[Keys.workExample] = value.dictionary as AnyObject
        }
        return dictionary
    }
}
