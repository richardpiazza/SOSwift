import Foundation
import SOSwiftVocabulary

public class SOMusicRecording: SOCreativeWork, MusicRecording {
    
    override public class var type: String {
        return "MusicRecording"
    }
}
