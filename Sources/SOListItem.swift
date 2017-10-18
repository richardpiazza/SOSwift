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
        
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .item) {
            self.item = value
        }
        if let value = try container.decodeIfPresent(SOListItem.self, forKey: .nextItem) {
            self.nextItem = value
        }
        if let value = try container.decodeIntegerOrTextIfPresent(forKey: .position) {
            self.position = value
        }
        if let value = try container.decodeIfPresent(SOListItem.self, forKey: .previousItem) {
            self.previousItem = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.item as? SOThing {
            try container.encode(value, forKey: .item)
        }
        if let value = self.nextItem as? SOListItem {
            try container.encode(value, forKey: .nextItem)
        }
        if let value = self.position {
            try container.encodeIntegerOrText(value, forKey: .position)
        }
        if let value = self.previousItem as? SOListItem {
            try container.encode(value, forKey: .previousItem)
        }
        
        try super.encode(to: encoder)
    }
}
