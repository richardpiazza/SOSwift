import Foundation
import SOSwiftVocabulary

/// An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.
public class SOAction: SOThing, Action {
    public struct Keys {
        public static let actionStatus = "actionStatus"
        public static let agent = "agent"
        public static let endTime = "endTime"
        public static let error = "error"
        public static let instrument = "instrument"
        public static let location = "location"
        public static let object = "object"
        public static let participant = "participant"
        public static let result = "result"
        public static let startTime = "startTime"
        public static let target = "target"
    }
    
    override public class var type: String {
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.actionStatus] as? String {
            self.actionStatus = ActionStatus(rawValue: value)
        }
        if let value = dictionary[Keys.agent] as? [String : AnyObject] {
            if let typeName = value[SOThing.Keys.type] as? String, typeName == SOOrganization.type {
                self.agent = SOOrganization(dictionary: value)
            } else if let typeName = value[SOThing.Keys.type] as? String, typeName == SOPerson.type {
                self.agent = SOPerson(dictionary: value)
            }
        }
        if let value = dictionary[Keys.endTime] as? String {
            self.endTime = value
        }
        if let value = dictionary[Keys.error] as? [String : AnyObject] {
            self.error = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.instrument] as? [String : AnyObject] {
            self.instrument = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.location] {
            if let typedValue = value as? [String : AnyObject], typedValue[SOThing.Keys.type] as? String == SOPlace.type {
                self.location = SOPlace(dictionary: typedValue)
            } else if let typedValue = value as? [String : AnyObject], typedValue[SOThing.Keys.type] as? String == SOPostalAddress.type {
                self.location = SOPostalAddress(dictionary: typedValue)
            } else if let typedValue = value as? String {
                self.location = typedValue
            }
        }
        if let value = dictionary[Keys.object] as? [String : AnyObject] {
            self.object = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.participant] as? [String : AnyObject] {
            if let typeName = value[SOThing.Keys.type] as? String, typeName == SOOrganization.type {
                self.participant = SOOrganization(dictionary: value)
            } else if let typeName = value[SOThing.Keys.type] as? String, typeName == SOPerson.type {
                self.participant = SOPerson(dictionary: value)
            }
        }
        if let value = dictionary[Keys.result] as? [String : AnyObject] {
            self.result = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.startTime] as? String {
            self.startTime = value
        }
        if let value = dictionary[Keys.target] as? [String : AnyObject] {
            self.target = SOEntryPoint(dictionary: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.actionStatus {
            dictionary[Keys.actionStatus] = value.rawValue as AnyObject
        }
        if let value = self.agent {
            if let typedValue = value as? SOOrganization {
                dictionary[Keys.agent] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? SOPerson {
                dictionary[Keys.agent] = typedValue.dictionary as AnyObject
            }
        }
        if let value = self.endTime as? String {
            dictionary[Keys.endTime] = value as AnyObject
        }
        if let value = self.error as? SOThing {
            dictionary[Keys.error] = value.dictionary as AnyObject
        }
        if let value = self.instrument as? SOThing {
            dictionary[Keys.instrument] = value.dictionary as AnyObject
        }
        if let value = self.location {
            if let typedValue = value as? SOPlace {
                dictionary[Keys.location] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? SOPostalAddress {
                dictionary[Keys.location] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? String {
                dictionary[Keys.location] = typedValue as AnyObject
            }
        }
        if let value = self.object as? SOThing {
            dictionary[Keys.object] = value.dictionary as AnyObject
        }
        if let value = self.participant {
            if let typedValue = value as? SOOrganization {
                dictionary[Keys.participant] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? SOPerson {
                dictionary[Keys.participant] = typedValue.dictionary as AnyObject
            }
        }
        if let value = self.result as? SOThing {
            dictionary[Keys.result] = value.dictionary as AnyObject
        }
        if let value = self.startTime as? String {
            dictionary[Keys.startTime] = value as AnyObject
        }
        if let value = self.target as? SOEntryPoint {
            dictionary[Keys.target] = value.dictionary as AnyObject
        }
        return dictionary
    }
}
