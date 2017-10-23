import Foundation
import SOSwiftVocabulary

/// An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.
public class SOAction: SOThing, Action {

    public override class var type: String {
        return "Action"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .actionStatus) {
            self.actionStatus = ActionStatus(rawValue: value)
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .agent) {
            self.agent = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .endTime) {
            self.endTime = value
        }
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .error) {
            self.error = value
        }
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .instrument) {
            self.instrument = value
        }
        if let value = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .location) {
            self.location = value
        }
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .object) {
            self.object = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .participant) {
            self.participant = value
        }
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .result) {
            self.result = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .startTime) {
            self.startTime = value
        }
        if let value = try container.decodeIfPresent(SOEntryPoint.self, forKey: .target) {
            self.target = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.actionStatus {
            try container.encode(value.rawValue, forKey: .actionStatus)
        }
        try container.encodeIfPresent(self.agent, forKey: .agent)
        try container.encodeIfPresent(self.endTime, forKey: .endTime)
        if let value = self.error as? SOThing {
            try container.encode(value, forKey: .error)
        }
        if let value = self.instrument as? SOThing {
            try container.encode(value, forKey: .instrument)
        }
        try container.encodeIfPresent(self.location, forKey: .location)
        if let value = self.object as? SOThing {
            try container.encode(value, forKey: .object)
        }
        try container.encodeIfPresent(self.participant, forKey: .participant)
        if let value = self.result as? SOThing {
            try container.encode(value, forKey: .result)
        }
        try container.encodeIfPresent(self.startTime, forKey: .startTime)
        if let value = self.target as? SOEntryPoint {
            try container.encode(value, forKey: .target)
        }
        
        try super.encode(to: encoder)
    }
}
