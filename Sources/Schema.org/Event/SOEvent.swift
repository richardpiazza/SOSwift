import Foundation

public protocol SchemaEvent: SchemaThing {
    var about: SchemaThing? { get set }
    var actor: SchemaPerson? { get set }
    var aggregateRating: SchemaAggregateRating? { get set }
    var attendee: SchemaOrganizationOrPerson? { get set }
    var audience: SchemaAudience? { get set }
    var composer: SchemaOrganizationOrPerson? { get set }
    var contributor: SchemaOrganizationOrPerson? { get set }
    var director: SchemaPerson? { get set }
    var doorTime: SchemaDateTime? { get set }
    var duration: SchemaDuration? { get set }
    var endDate: SchemaDateOrDateTime? { get set }
    var eventStatus: EventStatus? { get set }
    var funder: SchemaOrganizationOrPerson? { get set }
    var inLanguage: SchemaLanguageOrText? { get set }
    var isAccessibleForFree: Bool? { get set }
    var location: SchemaPlaceOrPostalAddressOrText? { get set }
    var maximumAttendeeCapacity: Int? { get set }
    var offers: [SchemaOffer]? { get set }
    var organizer: SchemaOrganizationOrPerson? { get set }
    var performer: SchemaOrganizationOrPerson? { get set }
    var previousStartDate: SchemaDate? { get set }
    var recordedIn: SchemaCreativeWork? { get set }
    var remainingAttendeeCapacity: Int? { get set }
    var review: SchemaReview? { get set }
    var sponsor: SchemaOrganizationOrPerson? { get set }
    var startDate: SchemaDateOrDateTime? { get set }
    var subEvent: SchemaEvent? { get set }
    var superEvent: SchemaEvent? { get set }
    var translator: SchemaOrganizationOrPerson? { get set }
    var typicalAgeRange: String? { get set }
    var workFeatured: SchemaCreativeWork? { get set }
    var workPerformed: SchemaCreativeWork? { get set }
}
