import Foundation

/// A musical composition.
public protocol MusicComposition: CreativeWork {
    /// The person or organization who wrote a composition, or who is the composer of a work performed at some event.
    var composer: OrganizationOrPerson? { get set }
    /// The date and place the work was first performed.
    var firstPerformance: Event? { get set }
    /// Smaller compositions included in this work (e.g. a movement in a symphony).
    var includedComposition: MusicComposition? { get set }
    /// The International Standard Musical Work Code for the composition.
    var iswcCode: String? { get set }
    /// The person who wrote the words.
    var lyricist: Person? { get set }
    /// The words in the song.
    var lyrics: CreativeWork? { get set }
    /// An arrangement derived from the composition.
    var musicArrangement: MusicComposition? { get set }
    /// The type of composition (e.g. overture, sonata, symphony, etc.).
    var musicCompositionForm: String? { get set }
    /// The key, mode, or scale this composition uses.
    var musicalKey: String? { get set }
    /// An audio recording of the work.
    /// - Inverse property: recordingOf.
    var recordedAs: MusicRecording? { get set }
}
