import Foundation

/// Format of this release (the type of recording media used, ie. compact disc, digital media, LP, etc.).
public enum MusicReleaseFormat: String, CaseIterable, Codable {
    case cd = "CDFormat"
    case cassette = "CassetteFormat"
    case dvd = "DVDFormat"
    case digitalAudioTape = "DigitalAudioTapeFormat"
    case digital = "DigitalFormat"
    case laserDisc = "LaserDiscFormat"
    case vinyl = "VinylFormat"

    public var displayValue: String {
        switch self {
        case .cd: "CD"
        case .cassette: "Cassette"
        case .dvd: "DVD"
        case .digitalAudioTape: "Digital Tape"
        case .digital: "Digital"
        case .laserDisc: "Laser Disc"
        case .vinyl: "Vinyl"
        }
    }
}
