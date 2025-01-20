public typealias ListItemOrThingOrText = DoubleTextConjunction<ListItem, Thing>

public extension ListItemOrThingOrText {
    var listItem: ListItem? { first }
    var thing: Thing? { second }

    static func listItem(value: ListItem) -> Self {
        .first(value)
    }

    static func thing(value: Thing) -> Self {
        .second(value)
    }
}
