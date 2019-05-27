import Foundation
import SOSwiftVocabulary

/// A single item within a larger data feed.
public class SODataFeedItem: SOIntangible, DataFeedItem {
    
    public override class var type: String {
        return "DataFeedItem"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The date on which the CreativeWork was created or the item was added to a DataFeed.
    public var dateCreated: DateOnlyOrDateTime?
    /// The datetime the item was removed from the DataFeed.
    public var dateDeleted: DateTime?
    /// The date on which the CreativeWork was most recently modified or when the item's entry was modified within a DataFeed.
    public var dateModified: DateOnlyOrDateTime?
    /// An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists')’.
    public var item: Thing?
    
    private enum CodingKeys: String, CodingKey {
        case dateCreated
        case dateDeleted
        case dateModified
        case item
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        dateCreated = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateCreated)
        dateDeleted = try container.decodeDateTimeIfPresent(forKey: .dateDeleted)
        dateModified = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateModified)
        item = try container.decodeIfPresent(SOThing.self, forKey: .item)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(dateDeleted, forKey: .dateDeleted)
        try container.encodeIfPresent(dateModified, forKey: .dateModified)
        try container.encodeIfPresent(item, forKey: .item)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.dateCreated.rawValue:
            return "The date on which the CreativeWork was created or the item was added to a DataFeed."
        case CodingKeys.dateDeleted.rawValue:
            return "The datetime the item was removed from the DataFeed."
        case CodingKeys.dateModified.rawValue:
            return "The date on which the CreativeWork was most recently modified or when the item's entry was modified within a DataFeed."
        case CodingKeys.item.rawValue:
            return "An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists')’."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.dateCreated.rawValue:
            self.dateCreated = value as? DateOnlyOrDateTime
        case CodingKeys.dateDeleted.rawValue:
            self.dateDeleted = value as? DateTime
        case CodingKeys.dateModified.rawValue:
            self.dateModified = value as? DateOnlyOrDateTime
        case CodingKeys.item.rawValue:
            self.item = value as? Thing
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: DataFeedItem?, forKey key: K) throws {
        if let typedValue = value as? SODataFeedItem {
            try self.encode(typedValue, forKey: key)
        }
    }
}
