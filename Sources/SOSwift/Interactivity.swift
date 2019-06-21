import Foundation

public enum Interactivity: String, CaseIterable, Codable {
    case active = "active"
    case expositive = "expositive"
    case mixed = "mixed"
    
    public var displayValue: String {
        switch self {
        case .active: return "Active"
        case .expositive: return "Expositive"
        case .mixed: return "Mixed"
        }
    }
}
