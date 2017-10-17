import Foundation
import SOSwiftVocabulary

public class SOMusicAlbum: SOMusicPlaylist, MusicAlbum {
    
    public override class var type: String {
        return "MusicAlbum"
    }
    
}
