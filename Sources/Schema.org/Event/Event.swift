import Foundation

public protocol Event: Thing {
    var about: Thing? { get set }
    var actor: Person? { get set }
    var aggregateRating: AggregateRating? { get set }
    var attendee: OrganizationOrPerson? { get set }
    var audience: Audience? { get set }
    var composer: OrganizationOrPerson? { get set }
    var contributor: OrganizationOrPerson? { get set }
    var director: Person? { get set }
    var doorTime: DateTime? { get set }
    var duration: Duration? { get set }
    var endDate: DateOnlyOrDateTime? { get set }
    var eventStatus: EventStatus? { get set }
    var funder: OrganizationOrPerson? { get set }
    var inLanguage: LanguageOrText? { get set }
    var isAccessibleForFree: Bool? { get set }
    var location: PlaceOrPostalAddressOrText? { get set }
    var maximumAttendeeCapacity: Int? { get set }
    var offers: [Offer]? { get set }
    var organizer: OrganizationOrPerson? { get set }
    var performer: OrganizationOrPerson? { get set }
    var previousStartDate: DateOnly? { get set }
    var recordedIn: CreativeWork? { get set }
    var remainingAttendeeCapacity: Int? { get set }
    var review: Review? { get set }
    var sponsor: OrganizationOrPerson? { get set }
    var startDate: DateOnlyOrDateTime? { get set }
    var subEvent: Event? { get set }
    var superEvent: Event? { get set }
    var translator: OrganizationOrPerson? { get set }
    var typicalAgeRange: String? { get set }
    var workFeatured: CreativeWork? { get set }
    var workPerformed: CreativeWork? { get set }
}
