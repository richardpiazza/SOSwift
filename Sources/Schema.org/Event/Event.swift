import Foundation

/// An event happening at a certain time and location, such as a concert, lecture, or festival.
/// Ticketing information may be added via the offers property.
/// Repeated events may be structured as separate Event objects.
public protocol Event: Thing {
    /// The subject matter of the content.
    var about: Thing? { get set }
    /// An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.
    var actor: [Person]? { get set }
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    var aggregateRating: AggregateRating? { get set }
    /// A person or organization attending the event.
    var attendee: [OrganizationOrPerson]? { get set }
    /// An intended audience, i.e. a group for whom something was created.
    var audience: Audience? { get set }
    /// The person or organization who wrote a composition, or who is the composer of a work performed at some event.
    var composer: OrganizationOrPerson? { get set }
    /// A secondary contributor to the CreativeWork or Event.
    var contributor: OrganizationOrPerson? { get set }
    /// A director of e.g. tv, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.
    var director: [Person]? { get set }
    /// The time admission will commence.
    var doorTime: DateTime? { get set }
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    var duration: Duration? { get set }
    /// The end date and time of the item (in ISO 8601 date format).
    var endDate: DateOnlyOrDateTime? { get set }
    /// An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.
    var eventStatus: EventStatus? { get set }
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    var funder: OrganizationOrPerson? { get set }
    /// The language of the content or performance or used in an action. Please use one of the language codes from the IETF BCP 47 standard. See also availableLanguage.
    var inLanguage: LanguageOrText? { get set }
    /// A flag to signal that the publication is accessible for free.
    var isAccessibleForFree: Bool? { get set }
    /// The location of for example where the event is happening, an organization is located, or where an action takes place.
    var location: PlaceOrPostalAddressOrText? { get set }
    /// The total number of individuals that may attend an event or venue.
    var maximumAttendeeCapacity: Int? { get set }
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event.
    var offers: [Offer]? { get set }
    /// An organizer of an Event.
    var organizer: OrganizationOrPerson? { get set }
    /// A performer at the event—for example, a presenter, musician, musical group or actor.
    var performer: [OrganizationOrPerson]? { get set }
    /// Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.
    var previousStartDate: DateOnly? { get set }
    /// The CreativeWork that captured all or part of this Event.
    /// Inverse property: recordedAt.
    var recordedIn: CreativeWork? { get set }
    /// The number of attendee places for an event that remain unallocated.
    var remainingAttendeeCapacity: Int? { get set }
    /// A review of the item.
    var review: [Review]? { get set }
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    var sponsor: OrganizationOrPerson? { get set }
    /// The start date and time of the item (in ISO 8601 date format).
    var startDate: DateOnlyOrDateTime? { get set }
    /// An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference.
    /// Inverse property: superEvent.
    var subEvent: [Event]? { get set }
    /// An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.
    /// Inverse property: subEvent.
    var superEvent: Event? { get set }
    /// Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.
    var translator: OrganizationOrPerson? { get set }
    /// The typical expected age range, e.g. '7-9', '11-'.
    var typicalAgeRange: String? { get set }
    /// A work featured in some event, e.g. exhibited in an ExhibitionEvent. Specific subproperties are available for workPerformed (e.g. a play), or a workPresented (a Movie at a ScreeningEvent).
    var workFeatured: CreativeWork? { get set }
    /// A work performed in some event, for example a play performed in a TheaterEvent.
    var workPerformed: CreativeWork? { get set }
}
