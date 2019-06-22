import Foundation

public class Action: Thing {
    
    /// Indicates the current disposition of the Action.
    public var actionStatus: ActionStatus?
    
    /// The direct performer or driver of the action (animate or inanimate).
    /// - example: John wrote a book.
    public var agent: OrganizationOrPerson?
    
    /// The endTime of something.
    ///
    /// For a reserved event or service (e.g. FoodEstablishmentReservation), the
    /// time that it is expected to end. For actions that span a period of time,
    /// when the action was performed. e.g. John wrote a book from January to
    /// December.
    ///
    /// - note: Event uses startDate/endDate instead of startTime/endTime, even
    ///         when describing dates with times. This situation may be
    ///         clarified in future revisions.
    public var endTime: DateTime?
    
    /// For failed actions, more information on the cause of the failure.
    public var error: Thing?
    
    /// The object that helped the agent perform the action.
    /// - example: John wrote a book with a pen.
    public var instrument: Thing?
    
    /// The location of for example where the event is happening, an
    /// organization is located, or where an action takes place.
//    public var location: PlaceOrPostalAddressOrText?
    
    /// The object upon which the action is carried out, whose state is kept
    /// intact or changed. Also known as the semantic roles patient, affected or
    /// undergoer (which change their state) or theme (which doesn't).
    /// - example: John read a book.
    public var object: Thing?
    
    /// Other co-agents that participated in the action indirectly.
    /// - example: John wrote a book with Steve.
    public var participant: OrganizationOrPerson?
    
    /// The result produced in the action.
    /// - example: John wrote a book.
    public var result: Thing?
    
    /// The startTime of something.
    ///
    /// For a reserved event or service (e.g. FoodEstablishmentReservation), the
    /// time that it is expected to start. For actions that span a period of
    /// time, when the action was performed. e.g. John wrote a book from January
    /// to December.
    ///
    /// - note: Event uses startDate/endDate instead of startTime/endTime, even
    ///         when describing dates with times. This situation may be
    ///         clarified in future revisions.
    public var startTime: DateTime?
    
    /// Indicates a target EntryPoint for an Action.
//    public var target: EntryPoint?
    
}
