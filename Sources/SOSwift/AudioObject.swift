import Foundation

/// An audio file.
public class AudioObject: MediaObject {
    
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    public var transcript: String?
    
    internal enum AudioObjectCodingKeys: String, CodingKey {
        case transcript
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: AudioObjectCodingKeys.self)
        
        transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AudioObjectCodingKeys.self)
        
        try container.encodeIfPresent(transcript, forKey: .transcript)
        
        try super.encode(to: encoder)
    }
}
