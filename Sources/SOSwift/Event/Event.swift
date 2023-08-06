import Foundation

/// An event happening at a certain time and location, such as a concert, lecture, or festival.
///
/// * Ticketing information may be added via the offers property.
/// * Repeated events may be structured as separate Event objects.
public class Event: Thing {
    
    /// The subject matter of the content.
    public var about: Thing?
    
    /// An actor - in tv, radio, movie, video games etc. - or in an event.
    ///
    /// Actors can be associated with individual items or with a series, episode, clip.
    public var actors: [Person]?
    
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    
    /// A person or organization attending the event.
    public var attendees: [OrganizationOrPerson]?
    
    /// An intended audience
    ///
    /// ## Example
    /// A group for whom something was created.
    ///
    /// ## Supersedes
    /// _serviceAudience_
    public var audience: Audience?
    
    /// The person or organization who wrote a composition, or who is the composer of a work performed at some event.
    public var composer: OrganizationOrPerson?
    
    /// A secondary contributor to the CreativeWork or Event.
    public var contributor: OrganizationOrPerson?
    
    /// A director of an event.
    ///
    /// Directors can be associated with individual items or with a series, episode, clip.
    public var directors: [Person]?
    
    /// The time admission will commence.
    public var doorTime: DateTime?
    
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    public var duration: Duration?
    
    /// The end date and time of the item (in ISO 8601 date format).
    public var endDate: DateOnlyOrDateTime?
    
    /// An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.
    public var eventStatus: EventStatus?
    
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    
    /// The language of the content or performance or used in an action.
    ///
    /// Please use one of the language codes from the IETF BCP 47 standard.
    /// ## See Also
    /// _availableLanguage_
    public var inLanguage: LanguageOrText?
    
    /// A flag to signal that the publication is accessible for free.
    /// ## Supersedes
    /// _free_
    public var isAccessibleForFree: Bool?
    
    /// The location of for example where the event is happening, an organization is located, or where an action takes
    /// place.
    public var location: PlaceOrPostalAddressOrText?
    
    /// The total number of individuals that may attend an event or venue.
    public var maximumAttendeeCapacity: Int?
    
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a
    /// service, or give away tickets to an event.
    public var offers: [Offer]?
    
    /// An organizer of an Event.
    public var organizer: OrganizationOrPerson?
    
    /// A performer at the event—for example, a presenter, musician, musical group or actor.
    public var performers: [OrganizationOrPerson]?
    
    /// Used in conjunction with eventStatus for rescheduled or cancelled events.
    ///
    /// This property contains the previously scheduled start date. For rescheduled events, the startDate property
    /// should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and
    /// rescheduled multiple times, this field may be repeated.
    public var previousStartDate: DateOnly?
    
    /// The `CreativeWork` that captured all or part of this Event.
    /// ## Inverse Property
    /// _recordedAt_
    public var recordedIn: CreativeWork?
    
    /// The number of attendee places for an event that remain unallocated.
    public var remainingAttendeeCapacity: Int?
    
    /// A review of the item.
    /// ## Supersedes
    /// _reviews_
    public var reviews: [Review]?
    
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution.
    ///
    /// ## For Example
    /// A sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    
    /// The start date and time of the item (in ISO 8601 date format).
    public var startDate: DateOnlyOrDateTime?
    
    /// An Event that is part of this event.
    ///
    /// ## For Example
    /// A conference event includes many presentations, each of which is a subEvent of the conference.
    ///
    /// ## Supersedes
    /// _subEvents_
    /// ## Inverse Property
    /// _superEvent_
    public var subEvents: [Event]?
    
    /// An event that this event is a part of.
    ///
    /// ## For Example
    /// A collection of individual music performances might each have a music festival as their superEvent.
    ///
    /// ## Inverse Property
    /// _subEvent_
    public var superEvent: Event?
    
    /// Organization or person who adapts a creative work to different languages, regional  differences and technical
    /// requirements of a target market, or that translates during some event.
    public var translator: OrganizationOrPerson?
    
    /// The typical expected age range.
    ///
    /// ## For Example
    /// * '7-9'
    /// * '11-'
    public var typicalAgeRange: String?
    
    /// A work featured in some event.
    ///
    /// ## For Example
    /// Exhibited in an ExhibitionEvent.
    public var workFeatured: CreativeWork?
    
    /// A work performed in some event, for example a play performed in a TheaterEvent.
    public var workPerformed: CreativeWork?
    
    internal enum EventCodingKeys: String, CodingKey {
        case about
        case actors = "actor"
        case aggregateRating
        case attendees = "attendee"
        case audience
        case composer
        case contributor
        case directors = "director"
        case doorTime
        case duration
        case endDate
        case eventStatus
        case funder
        case inLanguage
        case isAccessibleForFree
        case location
        case maximumAttendeeCapacity
        case offers
        case organizer
        case performers = "performer"
        case previousStartDate
        case recordedIn
        case remainingAttendeeCapacity
        case reviews = "review"
        case sponsor
        case startDate
        case subEvents = "subEvent"
        case superEvent
        case translator
        case typicalAgeRange
        case workFeatured
        case workPerformed
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: EventCodingKeys.self)
        
        about = try container.decodeIfPresent(Thing.self, forKey: .about)
        actors = try container.decodeIfPresent([Person].self, forKey: .actors)
        aggregateRating = try container.decodeIfPresent(AggregateRating.self, forKey: .aggregateRating)
        attendees = try container.decodeIfPresent([OrganizationOrPerson].self, forKey: .attendees)
        audience = try container.decodeIfPresent(Audience.self, forKey: .audience)
        composer = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .composer)
        contributor = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .contributor)
        directors = try container.decodeIfPresent([Person].self, forKey: .directors)
        doorTime = try container.decodeIfPresent(DateTime.self, forKey: .doorTime)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        eventStatus = try container.decodeIfPresent(EventStatus.self, forKey: .eventStatus)
        funder = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .funder)
        inLanguage = try container.decodeIfPresent(LanguageOrText.self, forKey: .inLanguage)
        isAccessibleForFree = try container.decodeIfPresent(Bool.self, forKey: .isAccessibleForFree)
        location = try container.decodeIfPresent(PlaceOrPostalAddressOrText.self, forKey: .location)
        maximumAttendeeCapacity = try container.decodeIfPresent(Int.self, forKey: .maximumAttendeeCapacity)
        offers = try container.decodeIfPresent([Offer].self, forKey: .offers)
        organizer = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .organizer)
        performers = try container.decodeIfPresent([OrganizationOrPerson].self, forKey: .performers)
        previousStartDate = try container.decodeIfPresent(DateOnly.self, forKey: .previousStartDate)
        recordedIn = try container.decodeIfPresent(CreativeWork.self, forKey: .recordedIn)
        remainingAttendeeCapacity = try container.decodeIfPresent(Int.self, forKey: .remainingAttendeeCapacity)
        reviews = try container.decodeIfPresent([Review].self, forKey: .reviews)
        sponsor = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .sponsor)
        startDate = try container.decodeIfPresent(DateOnlyOrDateTime.self, forKey: .startDate)
        subEvents = try container.decodeIfPresent([Event].self, forKey: .subEvents)
        superEvent = try container.decodeIfPresent(Event.self, forKey: .superEvent)
        translator = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .translator)
        typicalAgeRange = try container.decodeIfPresent(String.self, forKey: .typicalAgeRange)
        workFeatured = try container.decodeIfPresent(CreativeWork.self, forKey: .workFeatured)
        workPerformed = try container.decodeIfPresent(CreativeWork.self, forKey: .workPerformed)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EventCodingKeys.self)
        
        try container.encodeIfPresent(about, forKey: .about)
        try container.encodeIfPresent(actors, forKey: .actors)
        try container.encodeIfPresent(aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(attendees, forKey: .attendees)
        try container.encodeIfPresent(audience, forKey: .audience)
        try container.encodeIfPresent(composer, forKey: .composer)
        try container.encodeIfPresent(contributor, forKey: .contributor)
        try container.encodeIfPresent(directors, forKey: .directors)
        try container.encodeIfPresent(doorTime, forKey: .doorTime)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(eventStatus, forKey: .eventStatus)
        try container.encodeIfPresent(funder, forKey: .funder)
        try container.encodeIfPresent(inLanguage, forKey: .inLanguage)
        try container.encodeIfPresent(isAccessibleForFree, forKey: .isAccessibleForFree)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(maximumAttendeeCapacity, forKey: .maximumAttendeeCapacity)
        try container.encodeIfPresent(offers, forKey: .offers)
        try container.encodeIfPresent(organizer, forKey: .organizer)
        try container.encodeIfPresent(performers, forKey: .performers)
        try container.encodeIfPresent(previousStartDate, forKey: .previousStartDate)
        try container.encodeIfPresent(recordedIn, forKey: .recordedIn)
        try container.encodeIfPresent(remainingAttendeeCapacity, forKey: .remainingAttendeeCapacity)
        try container.encodeIfPresent(reviews, forKey: .reviews)
        try container.encodeIfPresent(sponsor, forKey: .sponsor)
        try container.encodeIfPresent(startDate, forKey: .startDate)
        try container.encodeIfPresent(subEvents, forKey: .subEvents)
        try container.encodeIfPresent(superEvent, forKey: .superEvent)
        try container.encodeIfPresent(translator, forKey: .translator)
        try container.encodeIfPresent(typicalAgeRange, forKey: .typicalAgeRange)
        try container.encodeIfPresent(workFeatured, forKey: .workFeatured)
        try container.encodeIfPresent(workPerformed, forKey: .workPerformed)
        
        try super.encode(to: encoder)
    }
}
