import Foundation

/// Format of this release (the type of recording media used, ie. compact disc, digital media, LP, etc.).
public enum MusicReleaseFormat: String {
    case cd = "CDFormat"
    case cassette = "CassetteFormat"
    case dvd = "DVDFormat"
    case digitalAudioTape = "DigitalAudioTapeFormat"
    case digital = "DigitalFormat"
    case laserDisc = "LaserDiscFormat"
    case vinyl = "VinylFormat"
}
