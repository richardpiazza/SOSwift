import Foundation

/// A list of single or combined accessModes that are sufficient to understand all the intellectual content of a
/// resource.
public enum AccessModeSufficient: String, CaseIterable, Codable {
    case auditory
    case tactile
    case textual
    case visual

    public var displayValue: String {
        switch self {
        case .auditory: "Auditory"
        case .tactile: "Tactile"
        case .textual: "Textual"
        case .visual: "Visual"
        }
    }
}
