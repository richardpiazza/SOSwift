import Foundation

public protocol DataFeedItemConformance:
                    DataFeedItemOrThingOrText
                {}

/// A single item within a larger data feed.
public protocol DataFeedItem: Intangible, DataFeedItemConformance {
    /// The date on which the CreativeWork was created or the item was added to a DataFeed.
    var dateCreated: DateOnlyOrDateTime? { get set }
    /// The datetime the item was removed from the DataFeed.
    var dateDeleted: DateTime? { get set }
    /// The date on which the CreativeWork was most recently modified or when the item's entry was modified within a DataFeed.
    var dateModified: DateOnlyOrDateTime? { get set }
    /// An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists')’.
    var item: Thing? { get set }
}
