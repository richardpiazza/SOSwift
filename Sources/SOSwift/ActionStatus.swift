import Foundation

/// Indicates the current disposition of the Action.
public enum ActionStatus: String {
    case active = "ActiveActionStatus"
    case completed = "CompletedActionStatus"
    case failed = "FailedActionStatus"
    case potential = "PotentialActionStatus"
    
    public var displayValue: String {
        switch self {
        case .active: return "Active"
        case .completed: return "Completed"
        case .failed: return "Failed"
        case .potential: return "Potential"
        }
    }
}
