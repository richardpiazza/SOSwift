import Foundation
import SOSwiftVocabulary

public class SOMusicAlbum: SOMusicPlaylist, MusicAlbum {
    
    public override class var type: String {
        return "MusicAlbum"
    }
    
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicAlbum?, forKey key: K) throws {
        if let typedValue = value as? SOMusicAlbum {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [MusicAlbum]?, forKey key: K) throws {
        if let typedValue = value as? [SOMusicAlbum] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
