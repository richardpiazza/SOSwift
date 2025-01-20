import Foundation

/// Indicates the current disposition of the Action.
public enum ActionStatus: String, CaseIterable, Codable {
    case active = "ActiveActionStatus"
    case completed = "CompletedActionStatus"
    case failed = "FailedActionStatus"
    case potential = "PotentialActionStatus"

    public var displayValue: String {
        switch self {
        case .active: "Active"
        case .completed: "Completed"
        case .failed: "Failed"
        case .potential: "Potential"
        }
    }
}
