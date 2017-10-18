import Foundation
import SOSwiftVocabulary

/// An audio file.
public class SOAudioObject: SOMediaObject, AudioObject {

    public override class var type: String {
        return "AudioObject"
    }
    
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    public var transcript: String?
    
    private enum CodingKeys: String, CodingKey {
        case transcript
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .transcript) {
            self.transcript = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.transcript {
            try container.encode(value, forKey: .transcript)
        }
        
        try super.encode(to: encoder)
    }
}
