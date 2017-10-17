import Foundation
import SOSwiftVocabulary

public class SOMusicPlaylist: SOCreativeWork, MusicPlaylist {
    
    public override class var type: String {
        return "MusicPlaylist"
    }
}
