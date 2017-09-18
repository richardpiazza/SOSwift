import Foundation

public protocol MusicGroupConformance:
                    MusicGroupOrPerson
                {}

/// A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
public protocol MusicGroup: PerformingGroup, MusicGroupConformance {
    /// A music album.
    var album: [MusicAlbum]? { get set }
    /// Genre of the creative work, broadcast channel or group.
    var genre: TextOrURL? { get set }
    /// A music recording (track) - usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.
    var track: [ItemListOrMusicRecording]? { get set }
}
