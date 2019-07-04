import Foundation

public class ListItem: Intangible {
    
    /// An entity represented by an entry in a list or data feed
    /// (e.g. an 'artist' in a list of 'artists')’.
    public var item: Thing?
    
    /// A link to the ListItem that follows the current one.
    public var nextItem: ListItem?
    
    /// The position of an item in a series or sequence of items.
    public var position: IntegerOrText?
    
    /// A link to the ListItem that preceeds the current one.
    public var previousItem: ListItem?
    
    internal enum ListItemCodingKeys: String, CodingKey {
        case item
        case nextItem
        case position
        case previousItem
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: ListItemCodingKeys.self)
        
        item = try container.decodeIfPresent(Thing.self, forKey: .item)
        nextItem = try container.decodeIfPresent(ListItem.self, forKey: .nextItem)
        position = try container.decodeIfPresent(IntegerOrText.self, forKey: .position)
        previousItem = try container.decodeIfPresent(ListItem.self, forKey: .previousItem)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ListItemCodingKeys.self)
        
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(nextItem, forKey: .nextItem)
        try container.encodeIfPresent(position, forKey: .position)
        try container.encodeIfPresent(previousItem, forKey: .previousItem)
        
        try super.encode(to: encoder)
    }
}
