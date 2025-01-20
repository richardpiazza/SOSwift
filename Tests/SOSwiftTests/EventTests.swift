@testable import SOSwift
import XCTest

class EventTests: XCTestCase {

    public static var event: Event {
        let event = Event()
        event.about = ThingTests.thing
        event.actors = nil
        event.aggregateRating = nil
        event.attendees = nil
        event.audience = nil
        event.composer = nil
        event.contributor = nil
        event.directors = nil
        event.doorTime = DateTimeTests.dateTime2
        event.duration = nil
        event.endDate = DateOnlyOrDateTime(DateTimeTests.dateTime1)
        event.eventStatus = nil
        event.inLanguage = nil
        event.isAccessibleForFree = nil
        event.location = nil
        event.maximumAttendeeCapacity = nil
        event.offers = nil
        event.organizer = nil
        event.performers = nil
        event.previousStartDate = nil
        event.recordedIn = nil
        event.remainingAttendeeCapacity = nil
        event.reviews = nil
        event.sponsor = nil
        event.startDate = DateOnlyOrDateTime(DateTimeTests.dateTime3)
        event.subEvents = nil
        event.superEvent = nil
        event.translator = nil
        event.typicalAgeRange = nil
        event.workFeatured = nil
        event.workPerformed = nil
        return event
    }

    func testSchema() throws {
        XCTAssertEqual(Event.schemaName, "Event")
    }

    func testDecode() throws {
        let json = """
        {
            "about": {
                "@type": "Thing",
                "name": ""
            },
            "actor": [
                {
                    "@type": "Person",
                    "name": ""
                }
            ],

        }
        """

        let _ = try Event.make(with: json)
    }

    func testEncode() throws {
        let dictionary = try EventTests.event.asDictionary()

        let doorTime = dictionary[Event.EventCodingKeys.doorTime.rawValue] as? String

        XCTAssertEqual(doorTime, DateTimeTests.dateTime2String)
    }
}
