import Foundation

public protocol CreativeWorkConformance:
                    CreativeWorkOrURL,
                    CreativeWorkOrText,
                    CreativeWorkOrProductOrURL
                {}

public protocol CreativeWork: Thing, CreativeWorkConformance {
    var about: Thing? { get set }
    var accessMode: AccessMode? { get set }
    var accessModeSufficient: [AccessModeSufficient]? { get set }
    var accessibilityAPI: AccessibilityAPI? { get set }
    var accessibilityControl: AccessibilityControl? { get set }
    var accessibilityFeature: AccessibilityFeature? { get set }
    var accessibilityHazard: AccessibilityHazard? { get set }
    var accessibilitySummary: String? { get set }
    var accountablePerson: Person? { get set }
    var aggregateRating: AggregateRating? { get set }
    var alternativeHeadline: String? { get set }
    var associatedMedia: MediaObject? { get set }
    var audience: Audience? { get set }
    var audio: AudioObject? { get set }
    var author: OrganizationOrPerson? { get set }
    var award: String? { get set }
    var character: Person? { get set }
    var citation: CreativeWorkOrText? { get set }
    var comment: Comment? { get set }
    var commentCount: Int? { get set }
    var contentLocation: Place? { get set }
    var contentRating: String? { get set }
    var contributor: OrganizationOrPerson? { get set }
    var copyrightHolder: OrganizationOrPerson? { get set }
    var copyrightYear: Int? { get set }
    var creator: OrganizationOrPerson? { get set }
    var dateCreated: DateOnlyOrDateTime? { get set }
    var dateModified: DateOnlyOrDateTime? { get set }
    var datePublished: DateOnly? { get set }
    var discussionURL: URL? { get set }
    var editor: Person? { get set }
    var educationalAlignment: AlignmentObject? { get set }
    var educationalUse: String? { get set }
    var encoding: MediaObject? { get set }
    var exampleOfWork: CreativeWork? { get set }
    var fileFormat: TextOrURL?  { get set }
    var funder: OrganizationOrPerson?  { get set }
    var genre: TextOrURL?  { get set }
    var hasPart: CreativeWork?  { get set }
    var headline: String?  { get set }
    var inLanguage: LanguageOrText?  { get set }
    var interactionStatistic: InteractionCounter?  { get set }
    var interactivityType: Interactivity?  { get set }
    var isAccessibleForFree: Bool?  { get set }
    var isBasedOn: CreativeWorkOrProductOrURL?  { get set }
    var isFamilyFriendly: Bool?  { get set }
    var isPartOf: CreativeWork?  { get set }
    var keywords: String?  { get set }
    var learningResourceType: String?  { get set }
    var license: CreativeWorkOrURL?  { get set }
    var locationCreated: Place?  { get set }
    var mainEntity: Thing?  { get set }
    var material: ProductOrTextOrURL?  { get set }
    var mentions: Thing?  { get set }
    var offers: [Offer]?  { get set }
    var position: IntegerOrText?  { get set }
    var producer: OrganizationOrPerson?  { get set }
    var provider: OrganizationOrPerson?  { get set }
    var releasedEvent: PublicationEvent?  { get set }
    var review: Review?  { get set }
    var schemaVersion: TextOrURL?  { get set }
    var sourceOrganization: Organization?  { get set }
    var spatialCoverage: Place?  { get set }
    var sponsor: OrganizationOrPerson?  { get set }
    var temporalCoverage: DateTimeOrTextOrURL?  { get set }
    var text: String?  { get set }
    var thumbnailURL: URL?  { get set }
    var timeRequired: Duration?  { get set }
    var translator: OrganizationOrPerson?  { get set }
    var typicalAgeRange: String?  { get set }
    var version: IntegerOrText?  { get set }
    var video: VideoObject?  { get set }
    var workExample: CreativeWork?  { get set }
}

