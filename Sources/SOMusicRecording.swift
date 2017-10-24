import Foundation
import SOSwiftVocabulary

public class SOMusicRecording: SOCreativeWork, MusicRecording {
    
    public override class var type: String {
        return "MusicRecording"
    }
    
    public override init() {
        super.init()
    }
  
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicRecording?, forKey key: K) throws {
        if let typedValue = value as? SOMusicRecording {
            try self.encode(typedValue, forKey: key)
        }
    }
}
