import Foundation
import SOSwiftVocabulary

public class SOListItem: SOIntangible, ListItem {
    
    public override class var type: String {
        return "ListItem"
    }
    
    /// An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists')’.
    public var item: Thing?
    /// A link to the ListItem that follows the current one.
    public var nextItem: ListItem?
    /// The position of an item in a series or sequence of items.
    public var position: IntegerOrText?
    /// A link to the ListItem that preceeds the current one.
    public var previousItem: ListItem?
    
    private enum CodingKeys: String, CodingKey {
        case item
        case nextItem
        case position
        case previousItem
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.item = try container.decodeIfPresent(SOThing.self, forKey: .item)
        self.nextItem = try container.decodeIfPresent(SOListItem.self, forKey: .nextItem)
        self.position = try container.decodeIntegerOrTextIfPresent(forKey: .position)
        self.previousItem = try container.decodeIfPresent(SOListItem.self, forKey: .previousItem)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.item, forKey: .item)
        try container.encodeIfPresent(self.nextItem, forKey: .nextItem)
        try container.encodeIfPresent(self.position, forKey: .position)
        try container.encodeIfPresent(self.previousItem, forKey: .previousItem)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: ListItem?, forKey key: K) throws {
        if let typedValue = value as? SOListItem {
            try self.encode(typedValue, forKey: key)
        }
    }
}
