import Foundation

/// An audio file.
public class SOAudioObject: SOMediaObject, AudioObject {
    override public class var type: String {
        return "AudioObject"
    }
    
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    public var transcript: String?
}
