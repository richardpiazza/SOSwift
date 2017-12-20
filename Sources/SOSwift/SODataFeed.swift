import Foundation
import SOSwiftVocabulary

public class SODataFeed: SODataset, DataFeed {
    
    public override class var type: String {
        return "DataFeed"
    }
    
    /// An item within in a data feed. Data feeds may have many elements.
    public var dataFeedElement: DataFeedItemOrThingOrText?
    
    private enum CodingKeys: String, CodingKey {
        case dataFeedElement
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.dataFeedElement = try container.decodeDataFeedItemOrThingOrTextIfPresent(forKey: .dataFeedElement)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.dataFeedElement, forKey: .dataFeedElement)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: DataFeed?, forKey key: K) throws {
        if let typedValue = value as? SODataFeed {
            try self.encode(typedValue, forKey: key)
        }
    }
}
