import Foundation
import SOSwiftVocabulary

public class SODataFeed: SODataset, DataFeed {
    
    public override class var type: String {
        return "DataFeed"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: DataFeed?, forKey key: K) throws {
        if let typedValue = value as? SODataFeed {
            try self.encode(typedValue, forKey: key)
        }
    }
}
