import XCTest
@testable import SOSwift

class ActionTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    private var startTimeComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 30, hour: 8, minute: 34, second: 22, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    private var endTimeComponents: DateComponents {
        return DateComponents(calendar: Calendar.current, timeZone: TimeZone.gmt, era: nil, year: 2019, month: 6, day: 30, hour: 13, minute: 16, second: 17, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    func testSchema() throws {
        XCTAssertEqual(Action.schemaType, "Action")
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
        XCTAssertEqual(action.agent?.person?.name, "Bob")
        XCTAssertEqual(action.endTime?.rawValue, endTimeComponents.date)
        XCTAssertEqual(action.error?.name, "Slipped")
        XCTAssertEqual(action.instrument?.name, "Scalpel")
        XCTAssertEqual(action.location?.place?.name, "Bob's Hospital")
        XCTAssertEqual(action.object?.name, "Patient")
        XCTAssertEqual(action.participant?.person?.name, "Adam")
        XCTAssertEqual(action.result?.name, "Horrible Scar")
        XCTAssertEqual(action.startTime?.rawValue, startTimeComponents.date)
        XCTAssertEqual(action.target?.name, "None")
    }
    
    func testEncode() throws {
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
        
        let dictionary = try action.asDictionary()
        
        XCTAssertEqual(dictionary["actionStatus"] as? String, ActionStatus.completed.rawValue)
        XCTAssertEqual((dictionary["agent"] as? [String : Any])?["name"] as? String, "Bob")
        XCTAssertEqual(dictionary["endTime"] as? String, "2019-06-30T13:16:17Z")
        XCTAssertEqual((dictionary["error"] as? [String : Any])?["name"] as? String, "Slipped")
        XCTAssertEqual((dictionary["instrument"] as? [String : Any])?["name"] as? String, "Scalpel")
        XCTAssertEqual((dictionary["location"] as? [String : Any])?["name"] as? String, "Bob's Hospital")
        XCTAssertEqual((dictionary["object"] as? [String : Any])?["name"] as? String, "Patient")
        XCTAssertEqual((dictionary["participant"] as? [String : Any])?["name"] as? String, "Adam")
        XCTAssertEqual((dictionary["result"] as? [String : Any])?["name"] as? String, "Horrible Scar")
        XCTAssertEqual(dictionary["startTime"] as? String, "2019-06-30T08:34:22Z")
        XCTAssertEqual((dictionary["target"] as? [String : Any])?["name"] as? String, "None")
    }
    
}
