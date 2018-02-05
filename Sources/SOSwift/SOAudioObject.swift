import Foundation
import SOSwiftVocabulary

/// An audio file.
public class SOAudioObject: SOMediaObject, AudioObject {

    public override class var type: String {
        return "AudioObject"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    public var transcript: String?
    
    private enum CodingKeys: String, CodingKey {
        case transcript
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.transcript.rawValue:
            return "The transcript of an Audio Object or Viedo Object."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.transcript.rawValue:
            self.transcript = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: AudioObject?, forKey key: K) throws {
        if let typedValue = value as? SOAudioObject {
            try self.encode(typedValue, forKey: key)
        }
    }
}
