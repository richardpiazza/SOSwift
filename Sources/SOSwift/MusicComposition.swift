import Foundation

/// A musical composition.
public class MusicComposition: CreativeWork {
    
    /// The person or organization who wrote a composition, or who is the
    /// composer of a work performed at some event.
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
    
    internal enum MusicCompositionCodingKeys: String, CodingKey {
        case composer
        case firstPerformance
        case includedComposition
        case iswcCode
        case lyricist
        case lyrics
        case musicArrangement
        case musicComponsitionForm
        case musicalKey
        case recordedAs
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MusicCompositionCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MusicCompositionCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
