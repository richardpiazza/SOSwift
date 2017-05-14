import Foundation

public protocol SchemaEvent: Thing {
    var about: Thing? { get set }
    var actor: SchemaPerson? { get set }
    var aggregateRating: SchemaAggregateRating? { get set }
    var attendee: OrganizationOrPerson? { get set }
    var audience: SchemaAudience? { get set }
    var composer: OrganizationOrPerson? { get set }
    var contributor: OrganizationOrPerson? { get set }
    var director: SchemaPerson? { get set }
    var doorTime: DateTime? { get set }
    var duration: Duration? { get set }
    var endDate: DateOnlyOrDateTime? { get set }
    var eventStatus: EventStatus? { get set }
    var funder: OrganizationOrPerson? { get set }
    var inLanguage: LanguageOrText? { get set }
    var isAccessibleForFree: Bool? { get set }
    var location: PlaceOrPostalAddressOrText? { get set }
    var maximumAttendeeCapacity: Int? { get set }
    var offers: [SchemaOffer]? { get set }
    var organizer: OrganizationOrPerson? { get set }
    var performer: OrganizationOrPerson? { get set }
    var previousStartDate: DateOnly? { get set }
    var recordedIn: SchemaCreativeWork? { get set }
    var remainingAttendeeCapacity: Int? { get set }
    var review: SchemaReview? { get set }
    var sponsor: OrganizationOrPerson? { get set }
    var startDate: DateOnlyOrDateTime? { get set }
    var subEvent: SchemaEvent? { get set }
    var superEvent: SchemaEvent? { get set }
    var translator: OrganizationOrPerson? { get set }
    var typicalAgeRange: String? { get set }
    var workFeatured: SchemaCreativeWork? { get set }
    var workPerformed: SchemaCreativeWork? { get set }
}
