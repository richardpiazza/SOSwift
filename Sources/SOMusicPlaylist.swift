import Foundation
import SOSwiftVocabulary

public class SOMusicPlaylist: SOCreativeWork, MusicPlaylist {
    
    public override class var type: String {
        return "MusicPlaylist"
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicPlaylist?, forKey key: K) throws {
        if let typedValue = value as? SOMusicPlaylist {
            try self.encode(typedValue, forKey: key)
        }
    }
}
