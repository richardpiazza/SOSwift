import Foundation

/// A single item within a larger data feed.
public class DataFeedItem: Intangible {
    
    /// The date on which the CreativeWork was created or the item
    /// was added to a DataFeed.
    public var dateCreated: DateOnlyOrDateTime?
    
    /// The datetime the item was removed from the DataFeed.
    public var dateDeleted: DateTime?
    
    /// The date on which the CreativeWork was most recently modified or
    /// when the item's entry was modified within a DataFeed.
    public var dateModified: DateOnlyOrDateTime?
    
    /// An entity represented by an entry in a list or data feed
    /// (e.g. an 'artist' in a list of 'artists')’.
    public var item: Thing?
    
}
