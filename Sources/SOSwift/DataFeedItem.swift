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
        
        dateCreated = try container.decodeIfPresent(DateOnlyOrDateTime.self, forKey: .dateCreated)
        dateDeleted = try container.decodeIfPresent(DateTime.self, forKey: .dateDeleted)
        dateModified = try container.decodeIfPresent(DateOnlyOrDateTime.self, forKey: .dateModified)
        item = try container.decodeIfPresent(Thing.self, forKey: .item)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataFeedItemCodingKeys.self)
        
        try container.encodeIfPresent(dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(dateDeleted, forKey: .dateDeleted)
        try container.encodeIfPresent(dateModified, forKey: .dateModified)
        try container.encodeIfPresent(item, forKey: .item)
        
        try super.encode(to: encoder)
    }
}
