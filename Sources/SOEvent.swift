import Foundation
import SOSwiftVocabulary

/// An event happening at a certain time and location, such as a concert, lecture, or festival.
/// Ticketing information may be added via the offers property. 
/// Repeated events may be structured as separate Event objects.
public class SOEvent: SOThing, Event {
    public struct Keys {
        public static let about = "about"
        public static let actor = "actor"
        public static let aggregateRating = "aggregateRating"
        public static let attendee = "attendee"
        public static let audience = "audience"
        public static let composer = "composer"
        public static let contributor = "contributor"
        public static let director = "director"
        public static let doorTime = "doorTime"
        public static let duration = "duration"
        public static let endDate = "endDate"
        public static let eventStatus = "eventStatus"
        public static let funder = "funder"
        public static let inLanguage = "inLanguage"
        public static let isAccessibleForFree = "isAccessibleForFree"
        public static let location = "location"
        public static let maximumAttendeeCapacity = "maximumAttendeeCapacity"
        public static let offers = "offers"
        public static let organizer = "organizer"
        public static let performer = "performer"
        public static let previousStartDate = "previousStartDate"
        public static let recordedIn = "recordedIn"
        public static let remainingAttendeeCapacity = "remainingAttendeeCapacity"
        public static let review = "review"
        public static let sponsor = "sponsor"
        public static let startDate = "startDate"
        public static let subEvent = "subEvent"
        public static let superEvent = "superEvent"
        public static let translator = "translator"
        public static let typicalAgeRange = "typicalAgeRange"
        public static let workFeatured = "workFeatured"
        public static let workPerformed = "workPerformed"
    }
    
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.about] as? [String : AnyObject] {
            self.about = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.actor] {
            self.actor = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.aggregateRating] as? [String : AnyObject] {
            self.aggregateRating = SOAggregateRating(dictionary: value)
        }
        if let value = dictionary[Keys.attendee] {
            self.attendee = makeOrganizationOrPersons(anyObject: value)
        }
        if let value = dictionary[Keys.audience] as? [String : AnyObject] {
            self.audience = SOAudience(dictionary: value)
        }
        if let value = dictionary[Keys.composer] as? [String : AnyObject] {
            self.composer = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.contributor] as? [String : AnyObject] {
            self.contributor = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.director] {
            self.director = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.doorTime] as? String {
            self.doorTime = value
        }
        if let value = dictionary[Keys.duration] as? String {
            self.duration = value
        }
        if let value = dictionary[Keys.endDate] as? String {
            self.endDate = value
        }
        if let value = dictionary[Keys.eventStatus] as? String {
            self.eventStatus = EventStatus(rawValue: value)
        }
        if let value = dictionary[Keys.funder] as? [String : AnyObject] {
            self.funder = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.inLanguage] {
            self.inLanguage = makeLanguageOrText(anyObject: value)
        }
        if let value = dictionary[Keys.isAccessibleForFree] as? Bool {
            self.isAccessibleForFree = value
        }
        if let value = dictionary[Keys.location] {
            self.location = makePlaceOrPostalAddressOrText(anyObject: value)
        }
        if let value = dictionary[Keys.maximumAttendeeCapacity] as? Int {
            self.maximumAttendeeCapacity = value
        }
        if let value = dictionary[Keys.offers] {
            self.offers = makeOffers(anyObject: value)
        }
        if let value = dictionary[Keys.organizer] as? [String : AnyObject] {
            self.organizer = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.performer] {
            self.performer = makeOrganizationOrPersons(anyObject: value)
        }
        if let value = dictionary[Keys.previousStartDate] as? String {
            self.previousStartDate = value
        }
        if let value = dictionary[Keys.recordedIn] as? [String : AnyObject] {
            self.recordedIn = SOCreativeWork(dictionary: value)
        }
        if let value = dictionary[Keys.remainingAttendeeCapacity] as? Int {
            self.remainingAttendeeCapacity = value
        }
        if let value = dictionary[Keys.review] {
            self.review = makeReviews(anyObject: value)
        }
        if let value = dictionary[Keys.sponsor] as? [String : AnyObject] {
            self.sponsor = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.startDate] as? String {
            self.startDate = value
        }
        if let value = dictionary[Keys.subEvent] {
            self.subEvent = makeEvents(anyObject: value)
        }
        if let value = dictionary[Keys.superEvent] as? [String : AnyObject] {
            self.superEvent = SOEvent(dictionary: value)
        }
        if let value = dictionary[Keys.translator] as? [String : AnyObject] {
            self.translator = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.typicalAgeRange] as? String {
            self.typicalAgeRange = value
        }
        if let value = dictionary[Keys.workFeatured] as? [String : AnyObject] {
            self.workFeatured = SOCreativeWork(dictionary: value)
        }
        if let value = dictionary[Keys.workPerformed] as? [String : AnyObject] {
            self.workPerformed = SOCreativeWork(dictionary: value)
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.about as? SOThing {
            dictionary[Keys.about] = value.dictionary as AnyObject
        }
        if let value = self.actor as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.actor] = values as AnyObject
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            dictionary[Keys.aggregateRating] = value.dictionary as AnyObject
        }
        if let value = self.attendee {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.attendee] = values as AnyObject
        }
        if let value = self.audience as? SOAudience {
            dictionary[Keys.audience] = value.dictionary as AnyObject
        }
        if let value = self.composer?.dictionaryValue {
            dictionary[Keys.composer] = value
        }
        if let value = self.contributor?.dictionaryValue {
            dictionary[Keys.contributor] = value
        }
        if let value = self.director as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.director] = values as AnyObject
        }
        if let value = self.doorTime as? String {
            dictionary[Keys.doorTime] = value as AnyObject
        }
        if let value = self.duration as? String {
            dictionary[Keys.duration] = value as AnyObject
        }
        if let value = self.endDate as? String {
            dictionary[Keys.endDate] = value as AnyObject
        }
        if let value = self.eventStatus {
            dictionary[Keys.eventStatus] = value.rawValue as AnyObject
        }
        if let value = self.funder?.dictionaryValue {
            dictionary[Keys.funder] = value
        }
        if let value = self.inLanguage?.dictionaryValue {
            dictionary[Keys.inLanguage] = value
        }
        if let value = self.isAccessibleForFree {
            dictionary[Keys.isAccessibleForFree] = value as AnyObject
        }
        if let value = self.location?.dictionaryValue {
            dictionary[Keys.location] = value
        }
        if let value = self.maximumAttendeeCapacity {
            dictionary[Keys.maximumAttendeeCapacity] = value as AnyObject
        }
        if let value = self.offers as? [SOOffer] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.offers] = values as AnyObject
        }
        if let value = self.organizer?.dictionaryValue {
            dictionary[Keys.organizer] = value
        }
        if let value = self.performer {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.performer] = values as AnyObject
        }
        if let value = self.previousStartDate as? String {
            dictionary[Keys.previousStartDate] = value as AnyObject
        }
        if let value = self.recordedIn as? SOCreativeWork {
            dictionary[Keys.recordedIn] = value.dictionary as AnyObject
        }
        if let value = self.remainingAttendeeCapacity {
            dictionary[Keys.remainingAttendeeCapacity] = value as AnyObject
        }
        if let value = self.review as? [SOReview] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.review] = values as AnyObject
        }
        if let value = self.sponsor?.dictionaryValue {
            dictionary[Keys.sponsor] = value
        }
        if let value = self.startDate as? String {
            dictionary[Keys.startDate] = value as AnyObject
        }
        if let value = self.subEvent as? [SOEvent] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.subEvent] = values as AnyObject
        }
        if let value = self.superEvent as? SOEvent {
            dictionary[Keys.superEvent] = value.dictionary as AnyObject
        }
        if let value = self.translator?.dictionaryValue {
            dictionary[Keys.translator] = value
        }
        if let value = self.typicalAgeRange {
            dictionary[Keys.typicalAgeRange] = value as AnyObject
        }
        if let value = self.workFeatured as? SOCreativeWork {
            dictionary[Keys.workFeatured] = value.dictionary as AnyObject
        }
        if let value = self.workPerformed as? SOCreativeWork {
            dictionary[Keys.workPerformed] = value.dictionary as AnyObject
        }
        return dictionary
    }
}
