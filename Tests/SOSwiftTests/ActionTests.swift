@testable import SOSwift
import XCTest

class ActionTests: XCTestCase {

    public static let _actionStatus = ActionStatus.completed.rawValue
    public static let _agent = "Bob"
    public static let _endTime = "2019-06-30T13:16:17Z"
    public static let _error = "Slipped"
    public static let _instrument = "Scalpel"
    public static let _location = "Bob's Hospital"
    public static let _object = "Patient"
    public static let _participant = "Adam"
    public static let _result = "Horrible Scar"
    public static let _startTime = "2019-06-30T08:34:22Z"
    public static let _target = "None"

    public static var action: Action {
        let bob = Person()
        bob.name = "Bob"

        let error = Thing()
        error.name = "Slipped"

        let instrument = Thing()
        instrument.name = "Scalpel"

        let place = Place()
        place.name = "Bob's Hospital"

        let object = Thing()
        object.name = "Patient"

        let participant = Person()
        participant.name = "Adam"

        let result = Thing()
        result.name = "Horrible Scar"

        let target = EntryPoint()
        target.name = "None"

        let action = Action()
        action.actionStatus = .completed
        action.agent = OrganizationOrPerson(bob)
        action.endTime = DateTime(rawValue: endTimeComponents.date!)
        action.error = error
        action.instrument = instrument
        action.location = PlaceOrPostalAddressOrText(place)
        action.object = object
        action.participant = OrganizationOrPerson(participant)
        action.result = result
        action.startTime = DateTime(rawValue: startTimeComponents.date!)
        action.target = target
        return action
    }

    private static var startTimeComponents: DateComponents {
        DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 30, hour: 8, minute: 34, second: 22, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }

    private static var endTimeComponents: DateComponents {
        DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 30, hour: 13, minute: 16, second: 17, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }

    func testSchema() throws {
        XCTAssertEqual(Action.schemaName, "Action")
    }

    func testDecode() throws {
        let json = """
        {
            "actionStatus": "CompletedActionStatus",
            "agent": {
                "@type": "Person",
                "name": "Bob"
            },
            "endTime": "2019-06-30T13:16:17Z",
            "error": {
                "@type": "Thing",
                "name": "Slipped"
            },
            "instrument": {
                "@type": "Thing",
                "name": "Scalpel"
            },
            "location": {
                "@type": "Place",
                "name": "Bob's Hospital"
            },
            "object": {
                "@type": "Thing",
                "name": "Patient"
            },
            "participant": {
                "@type": "Person",
                "name": "Adam"
            },
            "result": {
                "@type": "Thing",
                "name": "Horrible Scar"
            },
            "startTime": "2019-06-30T08:34:22Z",
            "target": {
                "@type": "EntryPoint",
                "name": "None"
            }
        }
        """

        let action = try Action.make(with: json)
        XCTAssertEqual(action.actionStatus, .completed)
        XCTAssertEqual(action.agent?.person?.name, ActionTests._agent)
        XCTAssertEqual(action.endTime?.rawValue, ActionTests.endTimeComponents.date)
        XCTAssertEqual(action.error?.name, ActionTests._error)
        XCTAssertEqual(action.instrument?.name, ActionTests._instrument)
        XCTAssertEqual(action.location?.place?.name, ActionTests._location)
        XCTAssertEqual(action.object?.name, ActionTests._object)
        XCTAssertEqual(action.participant?.person?.name, ActionTests._participant)
        XCTAssertEqual(action.result?.name, ActionTests._result)
        XCTAssertEqual(action.startTime?.rawValue, ActionTests.startTimeComponents.date)
        XCTAssertEqual(action.target?.name, ActionTests._target)
    }

    func testEncode() throws {
        let dictionary = try ActionTests.action.asDictionary()

        let actionStatus = dictionary[Action.ActionCodingKeys.actionStatus.rawValue] as? String
        let agent = dictionary[Action.ActionCodingKeys.agent.rawValue] as? [String: Any]
        let endTime = dictionary[Action.ActionCodingKeys.endTime.rawValue] as? String
        let error = dictionary[Action.ActionCodingKeys.error.rawValue] as? [String: Any]
        let instrument = dictionary[Action.ActionCodingKeys.instrument.rawValue] as? [String: Any]
        let location = dictionary[Action.ActionCodingKeys.location.rawValue] as? [String: Any]
        let object = dictionary[Action.ActionCodingKeys.object.rawValue] as? [String: Any]
        let participant = dictionary[Action.ActionCodingKeys.participant.rawValue] as? [String: Any]
        let result = dictionary[Action.ActionCodingKeys.result.rawValue] as? [String: Any]
        let startTime = dictionary[Action.ActionCodingKeys.startTime.rawValue] as? String
        let target = dictionary[Action.ActionCodingKeys.target.rawValue] as? [String: Any]

        XCTAssertEqual(actionStatus, ActionTests._actionStatus)
        XCTAssertEqual(agent?["name"] as? String, ActionTests._agent)
        XCTAssertEqual(endTime, ActionTests._endTime)
        XCTAssertEqual(error?["name"] as? String, ActionTests._error)
        XCTAssertEqual(instrument?["name"] as? String, ActionTests._instrument)
        XCTAssertEqual(location?["name"] as? String, ActionTests._location)
        XCTAssertEqual(object?["name"] as? String, ActionTests._object)
        XCTAssertEqual(participant?["name"] as? String, ActionTests._participant)
        XCTAssertEqual(result?["name"] as? String, ActionTests._result)
        XCTAssertEqual(startTime, ActionTests._startTime)
        XCTAssertEqual(target?["name"] as? String, ActionTests._target)
    }
}
