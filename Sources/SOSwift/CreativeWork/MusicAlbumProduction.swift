import Foundation

/// Classification of the album by it's type of content: soundtrack, live album, studio album, etc.
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
        case .compilation: "Compilation"
        case .djMix: "DJ Mix"
        case .demo: "Demo"
        case .live: "Live"
        case .mixtape: "Mixtape"
        case .remix: "Remix"
        case .soundtrack: "Soundtrack"
        case .spokenWord: "Spoken Word"
        case .studio: "Studio"
        }
    }
}
