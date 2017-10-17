import Foundation
import SOSwiftVocabulary

/// An event happening at a certain time and location, such as a concert, lecture, or festival.
/// Ticketing information may be added via the offers property. 
/// Repeated events may be structured as separate Event objects.
public class SOEvent: SOThing, Event {

    override public class var type: String {
        return "Event"
    }
    
    /// The subject matter of the content.
    public var about: Thing?
    /// An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.
    public var actor: [Person]?
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// A person or organization attending the event.
    public var attendee: [OrganizationOrPerson]?
    /// An intended audience, i.e. a group for whom something was created. Supersedes serviceAudience.
    public var audience: Audience?
    /// The person or organization who wrote a composition, or who is the composer of a work performed at some event.
    public var composer: OrganizationOrPerson?
    /// A secondary contributor to the CreativeWork or Event.
    public var contributor: OrganizationOrPerson?
    /// A director of e.g. tv, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.
    public var director: [Person]?
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
    /// The language of the content or performance or used in an action. Please use one of the language codes from the IETF BCP 47 standard. See also availableLanguage.
    public var inLanguage: LanguageOrText?
    /// A flag to signal that the publication is accessible for free. Supersedes free.
    public var isAccessibleForFree: Bool?
    /// The location of for example where the event is happening, an organization is located, or where an action takes place.
    public var location: PlaceOrPostalAddressOrText?
    /// The total number of individuals that may attend an event or venue.
    public var maximumAttendeeCapacity: Int?
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event.
    public var offers: [Offer]?
    /// An organizer of an Event.
    public var organizer: OrganizationOrPerson?
    /// A performer at the event—for example, a presenter, musician, musical group or actor.
    public var performer: [OrganizationOrPerson]?
    /// Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.
    public var previousStartDate: DateOnly?
    /// The CreativeWork that captured all or part of this Event. Inverse property: recordedAt.
    public var recordedIn: CreativeWork?
    /// The number of attendee places for an event that remain unallocated.
    public var remainingAttendeeCapacity: Int?
    /// A review of the item. Supersedes reviews.
    public var review: [Review]?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// The start date and time of the item (in ISO 8601 date format).
    public var startDate: DateOnlyOrDateTime?
    /// An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference. Supersedes subEvents. Inverse property: superEvent.
    public var subEvent: [Event]?
    /// An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent. Inverse property: subEvent.
    public var superEvent: Event?
    /// Organization or person who adapts a creative work to different languages, regional  differences and technical requirements of a target market, or that translates during some event.
    public var translator: OrganizationOrPerson?
    /// The typical expected age range, e.g. '7-9', '11-'.
    public var typicalAgeRange: String?
    /// A work featured in some event, e.g. exhibited in an ExhibitionEvent. Specific subproperties are available for workPerformed (e.g. a play), or a workPresented (a Movie at a ScreeningEvent).
    public var workFeatured: CreativeWork?
    /// A work performed in some event, for example a play performed in a TheaterEvent.
    public var workPerformed: CreativeWork?
    
    private enum CodingKeys: String, CodingKey {
        case about
        case actor
        case aggregateRating
        case attendee
        case audience
        case composer
        case contributor
        case director
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
        case performer
        case previousStartDate
        case recordedIn
        case remainingAttendeeCapacity
        case review
        case sponsor
        case startDate
        case subEvent
        case superEvent
        case translator
        case typicalAgeRange
        case workFeatured
        case workPerformed
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}