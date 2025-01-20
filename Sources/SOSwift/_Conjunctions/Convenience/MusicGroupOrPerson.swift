public typealias MusicGroupOrPerson = SingleSchemaConjunction<MusicGroup, Person>

public extension MusicGroupOrPerson {
    var musicGroup: MusicGroup? { first }
    var person: Person? { second }

    static func musicGroup(value: MusicGroup) -> Self {
        .first(value)
    }

    static func person(value: Person) -> Self {
        .second(value)
    }
}
