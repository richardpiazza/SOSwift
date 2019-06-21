import Foundation

/// A list of single or combined accessModes that are sufficient to understand
/// all the intellectual content of a resource.
public enum AccessModeSufficient: String, CaseIterable, Codable {
    case auditory = "auditory"
    case tactile = "tactile"
    case textual = "textual"
    case visual = "visual"
    
    public var displayValue: String {
        switch self {
        case .auditory: return "Auditory"
        case .tactile: return "Tactile"
        case .textual: return "Textual"
        case .visual: return "Visual"
        }
    }
}
