import Foundation
import SOSwiftVocabulary

/// An audio file.
public class SOAudioObject: SOMediaObject, AudioObject {
    public struct Keys {
        public static let transcript = "transcript"
    }
    
    override public class var type: String {
        return "AudioObject"
    }
    
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    public var transcript: String?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.transcript] as? String {
            self.transcript = value
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.transcript {
            dictionary[Keys.transcript] = value as AnyObject
        }
        return dictionary
    }
}
