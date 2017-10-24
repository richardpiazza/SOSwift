import Foundation
import SOSwiftVocabulary

public class SODataset: SOCreativeWork, Dataset {
    
    public override class var type: String {
        return "Dataset"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Dataset?, forKey key: K) throws {
        if let typedValue = value as? SODataset {
            try self.encode(typedValue, forKey: key)
        }
    }
}
