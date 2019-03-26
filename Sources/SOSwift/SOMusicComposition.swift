import Foundation
import SOSwiftVocabulary

/// A musical composition.
public class SOMusicComposition: SOCreativeWork, MusicComposition {
    
    public override class var type: String {
        return "MusicComposition"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The person or organization who wrote a composition, or who is the composer of a work performed at some event.
    public var composer: OrganizationOrPerson?
    /// The date and place the work was first performed.
    public var firstPerformance: Event?
    /// Smaller compositions included in this work (e.g. a movement in a symphony).
    public var includedComposition: MusicComposition?
    /// The International Standard Musical Work Code for the composition.
    public var iswcCode: String?
    /// The person who wrote the words.
    public var lyricist: Person?
    /// The words in the song.
    public var lyrics: CreativeWork?
    /// An arrangement derived from the composition.
    public var musicArrangement: MusicComposition?
    /// The type of composition (e.g. overture, sonata, symphony, etc.).
    public var musicCompositionForm: String?
    /// The key, mode, or scale this composition uses.
    public var musicalKey: String?
    /// An audio recording of the work.
    /// - Inverse property: recordingOf.
    public var recordedAs: MusicRecording?
    
    private enum CodingKeys: String, CodingKey {
        case composer
        case firstPerformance
        case includedComposition
        case iswcCode
        case lyricist
        case lyrics
        case musicArrangement
        case musicCompositionForm
        case musicalKey
        case recordedAs
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.composer = try container.decodeOrganizationOrPersonIfPresent(forKey: .composer)
        self.firstPerformance = try container.decodeIfPresent(SOEvent.self, forKey: .firstPerformance)
        self.includedComposition = try container.decodeIfPresent(SOMusicComposition.self, forKey: .includedComposition)
        self.iswcCode = try container.decodeIfPresent(String.self, forKey: .iswcCode)
        self.lyricist = try container.decodeIfPresent(SOPerson.self, forKey: .lyricist)
        self.lyrics = try container.decodeIfPresent(SOCreativeWork.self, forKey: .lyrics)
        self.musicArrangement = try container.decodeIfPresent(SOMusicComposition.self, forKey: .musicArrangement)
        self.musicCompositionForm = try container.decodeIfPresent(String.self, forKey: .musicCompositionForm)
        self.musicalKey = try container.decodeIfPresent(String.self, forKey: .musicalKey)
        self.recordedAs = try container.decodeIfPresent(SOMusicRecording.self, forKey: .recordedAs)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.composer, forKey: .composer)
        try container.encodeIfPresent(self.firstPerformance, forKey: .firstPerformance)
        try container.encodeIfPresent(self.includedComposition, forKey: .includedComposition)
        try container.encodeIfPresent(self.iswcCode, forKey: .iswcCode)
        try container.encodeIfPresent(self.lyricist, forKey: .lyricist)
        try container.encodeIfPresent(self.lyrics, forKey: .lyrics)
        try container.encodeIfPresent(self.musicArrangement, forKey: .musicArrangement)
        try container.encodeIfPresent(self.musicCompositionForm, forKey: .musicCompositionForm)
        try container.encodeIfPresent(self.musicalKey, forKey: .musicalKey)
        try container.encodeIfPresent(self.recordedAs, forKey: .recordedAs)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.composer.rawValue:
            return "The person or organization who wrote a composition, or who is the composer of a work performed at some event."
        case CodingKeys.firstPerformance.rawValue:
            return "The date and place the work was first performed."
        case CodingKeys.includedComposition.rawValue:
            return "Smaller compositions included in this work."
        case CodingKeys.iswcCode.rawValue:
            return "The International Standard Musical Work Code for the composition."
        case CodingKeys.lyricist.rawValue:
            return "The person who wrote the words."
        case CodingKeys.lyrics.rawValue:
            return "The words in the song."
        case CodingKeys.musicArrangement.rawValue:
            return "An arrangement derived from the composition."
        case CodingKeys.musicCompositionForm.rawValue:
            return "The type of composition."
        case CodingKeys.musicalKey.rawValue:
            return "The key, mode, or scale this composition uses."
        case CodingKeys.recordedAs.rawValue:
            return "An audio recording of the work."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.composer.rawValue:
            self.composer = value as? OrganizationOrPerson
        case CodingKeys.firstPerformance.rawValue:
            self.firstPerformance = value as? Event
        case CodingKeys.includedComposition.rawValue:
            self.includedComposition = value as? MusicComposition
        case CodingKeys.iswcCode.rawValue:
            self.iswcCode = value as? String
        case CodingKeys.lyricist.rawValue:
            self.lyricist = value as? Person
        case CodingKeys.lyrics.rawValue:
            self.lyrics = value as? CreativeWork
        case CodingKeys.musicArrangement.rawValue:
            self.musicArrangement = value as? MusicComposition
        case CodingKeys.musicCompositionForm.rawValue:
            self.musicCompositionForm = value as? String
        case CodingKeys.musicalKey.rawValue:
            self.musicalKey = value as? String
        case CodingKeys.recordedAs.rawValue:
            self.recordedAs = value as? MusicRecording
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: MusicComposition?, forKey key: K) throws {
        if let typedValue = value as? SOMusicComposition {
            try self.encode(typedValue, forKey: key)
        }
    }
}
