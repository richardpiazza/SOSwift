import Foundation

/// The kind of release which this album is: single, EP or album.
public enum MusicAlbumRelease: String, CaseIterable, Codable {
    case album = "AlbumRelease"
    case broadcast = "BroadcastRelease"
    case ep = "EPRelease"
    case single = "SingleRelease"
    
    public var displayValue: String {
        switch self {
        case .album: return "Album"
        case .broadcast: return "Broadcast"
        case .ep: return "EP"
        case .single: return "Single"
        }
    }
}
