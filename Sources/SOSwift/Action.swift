import Foundation

public class Action: Thing {
    
    /// Indicates the current disposition of the Action.
    public var actionStatus: ActionStatus?
    
    /// The direct performer or driver of the action (animate or inanimate).
    ///
    /// ## Example
    /// John wrote a book.
    public var agent: OrganizationOrPerson?
    
    /// The endTime of something.
    ///
    /// For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For
    /// actions that span a period of time, when the action was performed.
    ///
    /// ## Example
    /// John wrote a book from January to December.
    ///
    /// - note: Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This
    ///         situation may be clarified in future revisions.
    public var endTime: DateTime?
    
    /// For failed actions, more information on the cause of the failure.
    public var error: Thing?
    
    /// The object that helped the agent perform the action.
    ///
    /// ## Example
    /// John wrote a book with a pen.
    public var instrument: Thing?
    
    /// The location of for example where the event is happening, an organization is located, or where an action takes
    /// place.
    public var location: PlaceOrPostalAddressOrText?
    
    /// The object upon which the action is carried out, whose state is kept intact or changed.
    ///
    /// Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which
    /// doesn't).
    ///
    /// ## Example
    /// John read a book.
    public var object: Thing?
    
    /// Other co-agents that participated in the action indirectly.
    ///
    /// ## Example
    /// John wrote a book with Steve.
    public var participant: OrganizationOrPerson?
    
    /// The result produced in the action.
    ///
    /// ## Example:
    /// * John wrote a book.
    public var result: Thing?
    
    /// The startTime of something.
    ///
    /// For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For
    /// actions that span a period of time, when the action was performed.
    ///
    /// ## Example
    /// John wrote a book from January to December.
    ///
    /// - note: Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This
    ///         situation may be clarified in future revisions.
    public var startTime: DateTime?
    
    /// Indicates a target EntryPoint for an Action.
    public var target: EntryPoint?
    
    internal enum ActionCodingKeys: String, CodingKey {
        case actionStatus
        case agent
        case endTime
        case error
        case instrument
        case location
        case object
        case participant
        case result
        case startTime
        case target
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: ActionCodingKeys.self)
        
        actionStatus = try container.decodeIfPresent(ActionStatus.self, forKey: .actionStatus)
        agent = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .agent)
        endTime = try container.decodeIfPresent(DateTime.self, forKey: .endTime)
        error = try container.decodeIfPresent(Thing.self, forKey: .error)
        instrument = try container.decodeIfPresent(Thing.self, forKey: .instrument)
        location = try container.decodeIfPresent(PlaceOrPostalAddressOrText.self, forKey: .location)
        object = try container.decodeIfPresent(Thing.self, forKey: .object)
        participant = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .participant)
        result = try container.decodeIfPresent(Thing.self, forKey: .result)
        startTime = try container.decodeIfPresent(DateTime.self, forKey: .startTime)
        target = try container.decodeIfPresent(EntryPoint.self, forKey: .target)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ActionCodingKeys.self)
        
        try container.encodeIfPresent(actionStatus, forKey: .actionStatus)
        try container.encodeIfPresent(agent, forKey: .agent)
        try container.encodeIfPresent(endTime, forKey: .endTime)
        try container.encodeIfPresent(error, forKey: .error)
        try container.encodeIfPresent(instrument, forKey: .instrument)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(object, forKey: .object)
        try container.encodeIfPresent(participant, forKey: .participant)
        try container.encodeIfPresent(result, forKey: .result)
        try container.encodeIfPresent(startTime, forKey: .startTime)
        try container.encodeIfPresent(target, forKey: .target)
        
        try super.encode(to: encoder)
    }
}
