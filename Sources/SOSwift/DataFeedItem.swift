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
    
    internal enum DataFeedItemCodingKeys: String, CodingKey {
        case dateCreated
        case dateDeleted
        case dateModified
        case item
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: DataFeedItemCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataFeedItemCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
