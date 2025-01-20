import Foundation

public enum Interactivity: String, CaseIterable, Codable {
    case active
    case expositive
    case mixed

    public var displayValue: String {
        switch self {
        case .active: "Active"
        case .expositive: "Expositive"
        case .mixed: "Mixed"
        }
    }
}
