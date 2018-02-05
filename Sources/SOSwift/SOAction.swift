import Foundation
import SOSwiftVocabulary

/// An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.
public class SOAction: SOThing, Action {

    public override class var type: String {
        return "Action"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// Indicates the current disposition of the Action.
    public var actionStatus: ActionStatus?
    /// The direct performer or driver of the action (animate or inanimate). e.g. John wrote a book.
    public var agent: OrganizationOrPerson?
    /// The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For actions that span a period of time, when the action was performed. e.g. John wrote a book from January to December.
    /// - note: that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.
    public var endTime: DateTime?
    /// For failed actions, more information on the cause of the failure.
    public var error: Thing?
    /// The object that helped the agent perform the action. e.g. John wrote a book with a pen.
    public var instrument: Thing?
    /// The location of for example where the event is happening, an organization is located, or where an action takes place.
    public var location: PlaceOrPostalAddressOrText?
    /// The object upon which the action is carried out, whose state is kept intact or changed. Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which doesn't). e.g. John read a book.
    public var object: Thing?
    /// Other co-agents that participated in the action indirectly. e.g. John wrote a book with Steve.
    public var participant: OrganizationOrPerson?
    /// The result produced in the action. e.g. John wrote a book.
    public var result: Thing?
    /// The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For actions that span a period of time, when the action was performed. e.g. John wrote a book from January to December.
    /// - note: that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.
    public var startTime: DateTime?
    /// Indicates a target EntryPoint for an Action.
    public var target: EntryPoint?
    
    private enum CodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .actionStatus) {
            self.actionStatus = ActionStatus(rawValue: value)
        }
        self.agent = try container.decodeOrganizationOrPersonIfPresent(forKey: .agent)
        self.endTime = try container.decodeDateTimeIfPresent(forKey: .endTime)
        self.error = try container.decodeIfPresent(SOThing.self, forKey: .error)
        self.instrument = try container.decodeIfPresent(SOThing.self, forKey: .instrument)
        self.location = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .location)
        self.object = try container.decodeIfPresent(SOThing.self, forKey: .object)
        self.participant = try container.decodeOrganizationOrPersonIfPresent(forKey: .participant)
        self.result = try container.decodeIfPresent(SOThing.self, forKey: .result)
        self.startTime = try container.decodeDateTimeIfPresent(forKey: .startTime)
        self.target = try container.decodeIfPresent(SOEntryPoint.self, forKey: .target)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.actionStatus?.rawValue, forKey: .actionStatus)
        try container.encodeIfPresent(self.agent, forKey: .agent)
        try container.encodeIfPresent(self.endTime, forKey: .endTime)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.instrument, forKey: .instrument)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.object, forKey: .object)
        try container.encodeIfPresent(self.participant, forKey: .participant)
        try container.encodeIfPresent(self.result, forKey: .result)
        try container.encodeIfPresent(self.startTime, forKey: .startTime)
        try container.encodeIfPresent(self.target, forKey: .target)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.actionStatus.rawValue:
            return "Indicates the current disposition of the Action."
        case CodingKeys.agent.rawValue:
            return "The direct performer or driver of the action (animate or inanimate)."
        case CodingKeys.endTime.rawValue:
            return "The End Time of something."
        case CodingKeys.error.rawValue:
            return "For failed actions, more information on the cause of the failure."
        case CodingKeys.instrument.rawValue:
            return "The object that helped the agent perform the action."
        case CodingKeys.location.rawValue:
            return "The location of for example where the event is happening, an organization is located, or where an action takes place."
        case CodingKeys.object.rawValue:
            return "The object upon which the action is carried out, whose state is kept intact or changed."
        case CodingKeys.participant.rawValue:
            return "Other co-agents that participated in the action indirectly."
        case CodingKeys.result.rawValue:
            return "The result produced in the action."
        case CodingKeys.startTime.rawValue:
            return "The Start Time of something."
        case CodingKeys.target.rawValue:
            return "Indicates a target EntryPoint for an Action."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.actionStatus.rawValue:
            self.actionStatus = value as? ActionStatus
        case CodingKeys.agent.rawValue:
            self.agent = value as? OrganizationOrPerson
        case CodingKeys.endTime.rawValue:
            self.endTime = value as? DateTime
        case CodingKeys.error.rawValue:
            self.error = value as? Thing
        case CodingKeys.instrument.rawValue:
            self.instrument = value as? Thing
        case CodingKeys.location.rawValue:
            self.location = value as? PlaceOrPostalAddressOrText
        case CodingKeys.object.rawValue:
            self.object = value as? Thing
        case CodingKeys.participant.rawValue:
            self.participant = value as? OrganizationOrPerson
        case CodingKeys.result.rawValue:
            self.result = value as? Thing
        case CodingKeys.startTime.rawValue:
            self.startTime = value as? DateTime
        case CodingKeys.target.rawValue:
            self .target = value as? EntryPoint
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Action?, forKey key: K) throws {
        if let typedValue = value as? SOAction {
            try self.encode(typedValue, forKey: key)
        }
    }
}
