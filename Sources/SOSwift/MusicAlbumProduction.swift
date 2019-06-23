import Foundation

/// Classification of the album by it's type of content: soundtrack,
/// live album, studio album, etc.
public enum MusicAlbumProduction: String, CaseIterable, Codable {
    case compilation = "CompilationAlbum"
    case djMix = "DJMixAlbum"
    case demo = "DemoAlbum"
    case live = "LiveAlbum"
    case mixtape = "MixtapeAlbum"
    case remix = "RemixAlbum"
    case soundtrack = "SoundtrackAlbum"
    case spokenWord = "SpokenWordAlbum"
    case studio = "StudioAlbum"
    
    public var displayValue: String {
        switch self {
        case .compilation: return "Compilation"
        case .djMix: return "DJ Mix"
        case .demo: return "Demo"
        case .live: return "Live"
        case .mixtape: return "Mixtape"
        case .remix: return "Remix"
        case .soundtrack: return "Soundtrack"
        case .spokenWord: return "Spoken Word"
        case .studio: return "Studio"
        }
    }
}
