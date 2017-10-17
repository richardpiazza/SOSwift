import Foundation
import SOSwiftVocabulary

public class SOMusicPlaylist: SOCreativeWork, MusicPlaylist {
    
    override public class var type: String {
        return "MusicPlaylist"
    }
}
