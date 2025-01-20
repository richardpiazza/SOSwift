public typealias ThingOrText = SingleTextConjunction<Thing>

public extension ThingOrText {
    var thing: Thing? { first }

    static func thing(value: Thing) -> Self {
        .first(value)
    }
}
