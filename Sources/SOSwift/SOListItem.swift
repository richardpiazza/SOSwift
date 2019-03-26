import Foundation
import SOSwiftVocabulary

public class SOListItem: SOIntangible, ListItem {
    
    public override class var type: String {
        return "ListItem"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
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
    
    public override init() {
        super.init()
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
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.item.rawValue:
            return "An entity represented by an entry in a list or data feed."
        case CodingKeys.nextItem.rawValue:
            return "A link to the ListItem that follows the current one."
        case CodingKeys.position.rawValue:
            return "The position of an item in a series or sequence of items."
        case CodingKeys.previousItem.rawValue:
            return "A link to the ListItem that preceeds the current one."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.item.rawValue:
            self.item = value as? Thing
        case CodingKeys.nextItem.rawValue:
            self.nextItem = value as? ListItem
        case CodingKeys.position.rawValue:
            self.position = value as? IntegerOrText
        case CodingKeys.previousItem.rawValue:
            self.previousItem = value as? ListItem
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ListItem?, forKey key: K) throws {
        if let typedValue = value as? SOListItem {
            try self.encode(typedValue, forKey: key)
        }
    }
}
