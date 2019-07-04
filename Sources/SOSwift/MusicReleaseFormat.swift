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
        case .cd: return "CD"
        case .cassette: return "Cassette"
        case .dvd: return "DVD"
        case .digitalAudioTape: return "Digital Tape"
        case .digital: return "Digital"
        case .laserDisc: return "Laser Disc"
        case .vinyl: return "Vinyl"
        }
    }
}
