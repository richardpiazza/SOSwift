import Foundation

/// An action performed by a direct agent and indirect participants upon a direct object.
/// Optionally happens at a location with the help of an inanimate instrument.
/// The execution of the action may produce a result.
/// Specific action sub-type documentation specifies the exact expectation of each argument/role.
public protocol Action: Thing {
    /// Indicates the current disposition of the Action.
    var actionStatus: ActionStatus? { get set }
    /// The direct performer or driver of the action (animate or inanimate). e.g. John wrote a book.
    var agent: OrganizationOrPerson? { get set }
    /// The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For actions that span a period of time, when the action was performed. e.g. John wrote a book from January to December.
    /// - note: that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.
    var endTime: DateTime? { get set }
    /// For failed actions, more information on the cause of the failure.
    var error: Thing? { get set }
    /// The object that helped the agent perform the action. e.g. John wrote a book with a pen.
    var instrument: Thing? { get set }
    /// The location of for example where the event is happening, an organization is located, or where an action takes place.
    var location: PlaceOrPostalAddressOrText? { get set }
    /// The object upon which the action is carried out, whose state is kept intact or changed. Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which doesn't). e.g. John read a book.
    var object: Thing? { get set }
    /// Other co-agents that participated in the action indirectly. e.g. John wrote a book with Steve.
    var participant: OrganizationOrPerson? { get set }
    /// The result produced in the action. e.g. John wrote a book.
    var result: Thing? { get set }
    /// The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For actions that span a period of time, when the action was performed. e.g. John wrote a book from January to December.
    /// - note: that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.
    var startTime: DateTime? { get set }
    /// Indicates a target EntryPoint for an Action.
    var target: EntryPoint? { get set }
}
