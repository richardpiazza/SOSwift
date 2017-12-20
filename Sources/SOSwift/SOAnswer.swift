import Foundation
import SOSwiftVocabulary

public class SOAnswer: SOComment, Answer {
    
    public override class var type: String {
        return "Answer"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Answer?, forKey key: K) throws {
        if let typedValue = value as? SOAnswer {
            try self.encode(typedValue, forKey: key)
        }
    }
}
