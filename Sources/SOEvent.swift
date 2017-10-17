import Foundation
import SOSwiftVocabulary

/// An event happening at a certain time and location, such as a concert, lecture, or festival.
/// Ticketing information may be added via the offers property. 
/// Repeated events may be structured as separate Event objects.
public class SOEvent: SOThing, Event {

    public override class var type: String {
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
        
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .about) {
            self.about = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .actor) {
            self.actor = value
        }
        if let value = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating) {
            self.aggregateRating = value
        }
        if let value = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .attendee) {
            self.attendee = value
        }
        if let value = try container.decodeIfPresent(SOAudience.self, forKey: .audience) {
            self.audience = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .composer) {
            self.composer = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .contributor) {
            self.contributor = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .director) {
            self.director = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .doorTime) {
            self.doorTime = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .duration) {
            self.duration = value
        }
        if let value = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .endDate) {
            self.endDate = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .eventStatus) {
            self.eventStatus = EventStatus(rawValue: value)
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder) {
            self.funder = value
        }
        if let value = try container.decodeLanguageOrTextIfPresent(forKey: .inLanguage) {
            self.inLanguage = value
        }
        if let value = try container.decodeIfPresent(Bool.self, forKey: .isAccessibleForFree) {
            self.isAccessibleForFree = value
        }
        if let value = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .location) {
            self.location = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .maximumAttendeeCapacity) {
            self.maximumAttendeeCapacity = value
        }
        if let value = try container.decodeIfPresent([SOOffer].self, forKey: .offers) {
            self.offers = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .organizer) {
            self.organizer = value
        }
        if let value = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .performer) {
            self.performer = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .previousStartDate) {
            self.previousStartDate = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .recordedIn) {
            self.recordedIn = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .remainingAttendeeCapacity) {
            self.remainingAttendeeCapacity = value
        }
        if let value = try container.decodeIfPresent([SOReview].self, forKey: .review) {
            self.review = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor) {
            self.sponsor = value
        }
        if let value = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .startDate) {
            self.startDate = value
        }
        if let value = try container.decodeIfPresent([SOEvent].self, forKey: .subEvent) {
            self.subEvent = value
        }
        if let value = try container.decodeIfPresent(SOEvent.self, forKey: .superEvent) {
            self.superEvent = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .translator) {
            self.translator = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .typicalAgeRange) {
            self.typicalAgeRange = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .workFeatured) {
            self.workFeatured = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .workPerformed) {
            self.workPerformed = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.about as? SOThing {
            try container.encode(value, forKey: .about)
        }
        if let value = self.actor as? [SOPerson] {
            try container.encode(value, forKey: .actor)
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            try container.encode(value, forKey: .aggregateRating)
        }
        if let value = self.attendee {
            try container.encodeOrganizationsOrPersons(value, forKey: .attendee)
        }
        if let value = self.audience as? SOAudience {
            try container.encode(value, forKey: .audience)
        }
        if let value = self.composer {
            try container.encodeOrganizationOrPerson(value, forKey: .composer)
        }
        if let value = self.contributor {
            try container.encodeOrganizationOrPerson(value, forKey: .contributor)
        }
        if let value = self.director as? [SOPerson] {
            try container.encode(value, forKey: .director)
        }
        if let value = self.doorTime {
            try container.encodeDateTime(value, forKey: .doorTime)
        }
        if let value = self.duration as? String {
            try container.encode(value, forKey: .duration)
        }
        if let value = self.endDate {
            try container.encodeDateOnlyOrDateTime(value, forKey: .endDate)
        }
        if let value = self.eventStatus {
            try container.encode(value.rawValue, forKey: .eventStatus)
        }
        if let value = self.funder {
            try container.encodeOrganizationOrPerson(value, forKey: .funder)
        }
        if let value = self.inLanguage {
            try container.encodeLanguageOrText(value, forKey: .inLanguage)
        }
        if let value = self.isAccessibleForFree {
            try container.encode(value, forKey: .isAccessibleForFree)
        }
        if let value = self.location {
            try container.encodePlaceOrPostalAddressOrText(value, forKey: .location)
        }
        if let value = self.maximumAttendeeCapacity {
            try container.encode(value, forKey: .maximumAttendeeCapacity)
        }
        if let value = self.offers as? [SOOffer] {
            try container.encode(value, forKey: .offers)
        }
        if let value = self.organizer {
            try container.encodeOrganizationOrPerson(value, forKey: .organizer)
        }
        if let value = self.performer {
            try container.encodeOrganizationsOrPersons(value, forKey: .performer)
        }
        if let value = self.previousStartDate as? String {
            try container.encode(value, forKey: .previousStartDate)
        }
        if let value = self.recordedIn as? SOCreativeWork {
            try container.encode(value, forKey: .recordedIn)
        }
        if let value = self.remainingAttendeeCapacity {
            try container.encode(value, forKey: .remainingAttendeeCapacity)
        }
        if let value = self.review as? [SOReview] {
            try container.encode(value, forKey: .review)
        }
        if let value = self.sponsor {
            try container.encodeOrganizationOrPerson(value, forKey: .sponsor)
        }
        if let value = self.startDate {
            try container.encodeDateOnlyOrDateTime(value, forKey: .startDate)
        }
        if let value = self.subEvent as? [SOEvent] {
            try container.encode(value, forKey: .subEvent)
        }
        if let value = self.superEvent as? SOEvent {
            try container.encode(value, forKey: .superEvent)
        }
        if let value = self.translator {
            try container.encodeOrganizationOrPerson(value, forKey: .translator)
        }
        if let value = self.typicalAgeRange {
            try container.encode(value, forKey: .typicalAgeRange)
        }
        if let value = self.workFeatured as? SOCreativeWork {
            try container.encode(value, forKey: .workFeatured)
        }
        if let value = self.workPerformed as? SOCreativeWork {
            try container.encode(value, forKey: .workPerformed)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
