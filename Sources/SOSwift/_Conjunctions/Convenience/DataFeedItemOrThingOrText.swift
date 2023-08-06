public typealias DataFeedItemOrThingOrText = DoubleTextConjunction<DataFeedItem, Thing>

public extension DataFeedItemOrThingOrText {
    var dataFeedItem: DataFeedItem? { first }
    var thing: Thing? { second }
}
