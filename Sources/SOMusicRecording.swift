import Foundation
import SOSwiftVocabulary

public class SOMusicRecording: SOCreativeWork, MusicRecording {
    
    public override class var type: String {
        return "MusicRecording"
    }
}
