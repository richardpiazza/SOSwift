import Foundation

/// Classification of the album by it's type of content: soundtrack, live album, studio album, etc.
public enum MusicAlbumProduction: String {
    case compilation = "CompilationAlbum"
    case djMix = "DJMixAlbum"
    case demo = "DemoAlbum"
    case live = "LiveAlbum"
    case mixtape = "MixtapeAlbum"
    case remix = "RemixAlbum"
    case soundtrack = "SoundtrackAlbum"
    case spokenWord = "SpokenWordAlbum"
    case studio = "StudioAlbum"
}
