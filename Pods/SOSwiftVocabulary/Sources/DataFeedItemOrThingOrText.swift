import Foundation

/// DataFeedItem, Thing, Text
public protocol DataFeedItemOrThingOrText {}

extension String: DataFeedItemOrThingOrText {}
