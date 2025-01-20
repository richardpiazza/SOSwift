public typealias CreativeWorkOrEvent = SingleSchemaConjunction<CreativeWork, Event>

public extension CreativeWorkOrEvent {
    var creativeWork: CreativeWork? { first }
    var event: Event? { second }

    static func creativeWork(value: CreativeWork) -> Self {
        .first(value)
    }

    static func event(value: Event) -> Self {
        .second(value)
    }
}
