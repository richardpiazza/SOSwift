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
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ListItemCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
