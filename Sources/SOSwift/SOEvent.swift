import Foundation
import SOSwiftVocabulary

/// An event happening at a certain time and location, such as a concert, lecture, or festival.
/// Ticketing information may be added via the offers property. 
/// Repeated events may be structured as separate Event objects.
public class SOEvent: SOThing, Event {
    
    public override class var type: String {
        return "Event"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOCourseInstance.self,
            SOPublicationEvent.self
        ]
    }
    
    /// The subject matter of the content.
    public var about: Thing?
    /// An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.
    public var actors: [Person]?
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// A person or organization attending the event.
    public var attendees: [OrganizationOrPerson]?
    /// An intended audience, i.e. a group for whom something was created. Supersedes serviceAudience.
    public var audience: Audience?
    /// The person or organization who wrote a composition, or who is the composer of a work performed at some event.
    public var composer: OrganizationOrPerson?
    /// A secondary contributor to the CreativeWork or Event.
    public var contributor: OrganizationOrPerson?
    /// A director of e.g. tv, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.
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
    public var performers: [OrganizationOrPerson]?
    /// Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.
    public var previousStartDate: DateOnly?
    /// The CreativeWork that captured all or part of this Event. Inverse property: recordedAt.
    public var recordedIn: CreativeWork?
    /// The number of attendee places for an event that remain unallocated.
    public var remainingAttendeeCapacity: Int?
    /// A review of the item. Supersedes reviews.
    public var reviews: [Review]?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// The start date and time of the item (in ISO 8601 date format).
    public var startDate: DateOnlyOrDateTime?
    /// An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference. Supersedes subEvents. Inverse property: superEvent.
    public var subEvents: [Event]?
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.about = try container.decodeIfPresent(SOThing.self, forKey: .about)
        self.actors = try container.decodeArrayOrElementIfPresent(SOPerson.self, forKey: .actors)
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.attendees = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .attendees)
        self.audience = try container.decodeIfPresent(SOAudience.self, forKey: .audience)
        self.composer = try container.decodeOrganizationOrPersonIfPresent(forKey: .composer)
        self.contributor = try container.decodeOrganizationOrPersonIfPresent(forKey: .contributor)
        self.directors = try container.decodeArrayOrElementIfPresent(SOPerson.self, forKey: .directors)
        self.doorTime = try container.decodeDateTimeIfPresent(forKey: .doorTime)
        self.duration = try container.decodeDurationIfPresent(forKey: .duration)
        self.endDate = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .endDate)
        if let value = try container.decodeIfPresent(String.self, forKey: .eventStatus) {
            self.eventStatus = EventStatus(rawValue: value)
        }
        self.funder = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder)
        self.inLanguage = try container.decodeLanguageOrTextIfPresent(forKey: .inLanguage)
        self.isAccessibleForFree = try container.decodeIfPresent(Bool.self, forKey: .isAccessibleForFree)
        self.location = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .location)
        self.maximumAttendeeCapacity = try container.decodeIfPresent(Int.self, forKey: .maximumAttendeeCapacity)
        self.offers = try container.decodeArrayOrElementIfPresent(SOOffer.self, forKey: .offers)
        self.organizer = try container.decodeOrganizationOrPersonIfPresent(forKey: .organizer)
        self.performers = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .performers)
        self.previousStartDate = try container.decodeDateOnlyIfPresent(forKey: .previousStartDate)
        self.recordedIn = try container.decodeIfPresent(SOCreativeWork.self, forKey: .recordedIn)
        self.remainingAttendeeCapacity = try container.decodeIfPresent(Int.self, forKey: .remainingAttendeeCapacity)
        self.reviews = try container.decodeArrayOrElementIfPresent(SOReview.self, forKey: .reviews)
        self.sponsor = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor)
        self.startDate = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .startDate)
        self.subEvents = try container.decodeArrayOrElementIfPresent(SOEvent.self, forKey: .subEvents)
        self.superEvent = try container.decodeIfPresent(SOEvent.self, forKey: .superEvent)
        self.translator = try container.decodeOrganizationOrPersonIfPresent(forKey: .translator)
        self.typicalAgeRange = try container.decodeIfPresent(String.self, forKey: .typicalAgeRange)
        self.workFeatured = try container.decodeIfPresent(SOCreativeWork.self, forKey: .workFeatured)
        self.workPerformed = try container.decodeIfPresent(SOCreativeWork.self, forKey: .workPerformed)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.about, forKey: .about)
        try container.encodeIfPresent(self.actors, forKey: .actors)
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.attendees, forKey: .attendees)
        try container.encodeIfPresent(self.audience, forKey: .audience)
        try container.encodeIfPresent(self.composer, forKey: .composer)
        try container.encodeIfPresent(self.contributor, forKey: .contributor)
        try container.encodeIfPresent(self.directors, forKey: .directors)
        try container.encodeIfPresent(self.doorTime, forKey: .doorTime)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.endDate, forKey: .endDate)
        try container.encodeIfPresent(self.eventStatus?.rawValue, forKey: .eventStatus)
        try container.encodeIfPresent(self.funder, forKey: .funder)
        try container.encodeIfPresent(self.inLanguage, forKey: .inLanguage)
        try container.encodeIfPresent(self.isAccessibleForFree, forKey: .isAccessibleForFree)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.maximumAttendeeCapacity, forKey: .maximumAttendeeCapacity)
        try container.encodeIfPresent(self.offers, forKey: .offers)
        try container.encodeIfPresent(self.organizer, forKey: .organizer)
        try container.encodeIfPresent(self.performers, forKey: .performers)
        try container.encodeIfPresent(self.previousStartDate, forKey: .previousStartDate)
        try container.encodeIfPresent(self.recordedIn, forKey: .recordedIn)
        try container.encodeIfPresent(self.remainingAttendeeCapacity, forKey: .remainingAttendeeCapacity)
        try container.encodeIfPresent(self.reviews, forKey: .reviews)
        try container.encodeIfPresent(self.sponsor, forKey: .sponsor)
        try container.encodeIfPresent(self.startDate, forKey: .startDate)
        try container.encodeIfPresent(self.subEvents, forKey: .subEvents)
        try container.encodeIfPresent(self.superEvent, forKey: .superEvent)
        try container.encodeIfPresent(self.translator, forKey: .translator)
        try container.encodeIfPresent(self.typicalAgeRange, forKey: .typicalAgeRange)
        try container.encodeIfPresent(self.workFeatured, forKey: .workFeatured)
        try container.encodeIfPresent(self.workPerformed, forKey: .workPerformed)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.about.rawValue:
            return "The subject matter of the content."
        case "actors":
            return "An actor."
        case CodingKeys.aggregateRating.rawValue:
            return "The overall rating, based on a collection of reviews or ratings, of the item."
        case "attendees":
            return "A person or organization attending the event."
        case CodingKeys.audience.rawValue:
            return "An intended grouyp for whom something was created."
        case CodingKeys.composer.rawValue:
            return "The person or organization who wrote a composition, or who is the composer of a work performed at some event."
        case CodingKeys.contributor.rawValue:
            return "A secondary contributor to the CreativeWork or Event."
        case "directors":
            return "A director."
        case CodingKeys.doorTime.rawValue:
            return "The time admission will commence."
        case CodingKeys.duration.rawValue:
            return "The duration of the item."
        case CodingKeys.endDate.rawValue:
            return "The end date and time of the item."
        case CodingKeys.eventStatus.rawValue:
            return "An eventStatus of an event represents its status."
        case CodingKeys.funder.rawValue:
            return "A person or organization that supports (sponsors) something through some kind of financial contribution."
        case CodingKeys.inLanguage.rawValue:
            return "The language of the content or performance or used in an action."
        case CodingKeys.isAccessibleForFree.rawValue:
            return "A flag to signal that the publication is accessible for free."
        case CodingKeys.location.rawValue:
            return "The location of for example where the event is happening, an organization is located, or where an action takes place."
        case CodingKeys.maximumAttendeeCapacity.rawValue:
            return "The total number of individuals that may attend an event or venue."
        case CodingKeys.offers.rawValue:
            return "An offer to provide this item."
        case CodingKeys.organizer.rawValue:
            return "An organizer of an Event."
        case "performers":
            return "A performer at the event—for example, a presenter, musician, musical group or actor."
        case CodingKeys.previousStartDate.rawValue:
            return "Used in conjunction with eventStatus for rescheduled or cancelled events."
        case CodingKeys.recordedIn.rawValue:
            return "The CreativeWork that captured all or part of this Event."
        case CodingKeys.remainingAttendeeCapacity.rawValue:
            return "The number of attendee places for an event that remain unallocated."
        case "reviews":
            return "A review of the item."
        case CodingKeys.sponsor.rawValue:
            return "A person or organization that supports a thing through a pledge, promise, or financial contribution."
        case CodingKeys.startDate.rawValue:
            return "The start date and time of the item."
        case "subEvents":
            return "An Event that is part of this event."
        case CodingKeys.superEvent.rawValue:
            return "An event that this event is a part of."
        case CodingKeys.translator.rawValue:
            return "Organization or person who adapts a creative work to different languages, regional  differences and technical requirements of a target market, or that translates during some event."
        case CodingKeys.typicalAgeRange.rawValue:
            return "The typical expected age range."
        case CodingKeys.workFeatured.rawValue:
            return "A work featured in some event."
        case CodingKeys.workPerformed.rawValue:
            return "A work performed in some event."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.about.rawValue:
            self.about = value as? Thing
        case "actors":
            self.actors = value as? [Person]
        case CodingKeys.aggregateRating.rawValue:
            self.aggregateRating = value as? AggregateRating
        case "attendees":
            self.attendees = value as? [OrganizationOrPerson]
        case CodingKeys.audience.rawValue:
            self.audience = value as? Audience
        case CodingKeys.composer.rawValue:
            self.composer = value as? OrganizationOrPerson
        case CodingKeys.contributor.rawValue:
            self.contributor = value as? OrganizationOrPerson
        case "directors":
            self.directors = value as? [Person]
        case CodingKeys.doorTime.rawValue:
            self.doorTime = value as? DateTime
        case CodingKeys.duration.rawValue:
            self.duration = value as? Duration
        case CodingKeys.endDate.rawValue:
            self.endDate = value as? DateOnlyOrDateTime
        case CodingKeys.eventStatus.rawValue:
            self.eventStatus = value as? EventStatus
        case CodingKeys.funder.rawValue:
            self.funder = value as? OrganizationOrPerson
        case CodingKeys.inLanguage.rawValue:
            self.inLanguage = value as? LanguageOrText
        case CodingKeys.isAccessibleForFree.rawValue:
            self.isAccessibleForFree = value as? Bool
        case CodingKeys.location.rawValue:
            self.location = value as? PlaceOrPostalAddressOrText
        case CodingKeys.maximumAttendeeCapacity.rawValue:
            self.maximumAttendeeCapacity = value as? Int
        case CodingKeys.offers.rawValue:
            self.offers = value as? [Offer]
        case CodingKeys.organizer.rawValue:
            self.organizer = value as? OrganizationOrPerson
        case "performers":
            self.performers = value as? [OrganizationOrPerson]
        case CodingKeys.previousStartDate.rawValue:
            self.previousStartDate = value as? DateOnly
        case CodingKeys.recordedIn.rawValue:
            self.recordedIn = value as? CreativeWork
        case CodingKeys.remainingAttendeeCapacity.rawValue:
            self.remainingAttendeeCapacity = value as? Int
        case "reviews":
            self.reviews = value as? [Review]
        case CodingKeys.sponsor.rawValue:
            self.sponsor = value as? OrganizationOrPerson
        case CodingKeys.startDate.rawValue:
            self.startDate = value as? DateOnlyOrDateTime
        case "subEvents":
            self.subEvents = value as? [Event]
        case CodingKeys.superEvent.rawValue:
            self.superEvent = value as? Event
        case CodingKeys.translator.rawValue:
            self.translator = value as? OrganizationOrPerson
        case CodingKeys.typicalAgeRange.rawValue:
            self.typicalAgeRange = value as? String
        case CodingKeys.workFeatured.rawValue:
            self.workFeatured = value as? CreativeWork
        case CodingKeys.workPerformed.rawValue:
            self.workPerformed = value as? CreativeWork
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Event?, forKey key: K) throws {
        if let typedValue = value as? SOEvent {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Event]?, forKey key: K) throws {
        if let typedValue = value as? [SOEvent] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
