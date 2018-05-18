import Foundation
import SOSwiftVocabulary

extension MusicReleaseFormat: AttributedEnum {
    public static var allCases: [MusicReleaseFormat] {
        return [.cd, .cassette, .dvd, .digitalAudioTape, .digital, .laserDisc, .vinyl]
    }
    
    public var displayName: String {
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
