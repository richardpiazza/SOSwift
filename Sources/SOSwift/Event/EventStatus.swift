import Foundation

/// An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.
public enum EventStatus: String, CaseIterable, Codable {
    case cancelled = "EventCancelled"
    case postponed = "EventPostponed"
    case rescheduled = "EventRescheduled"
    case scheduled = "EventScheduled"
    
    public var displayValue: String {
        switch self {
        case .cancelled: return "Cancelled"
        case .postponed: return "Postponed"
        case .rescheduled: return "Rescheduled"
        case .scheduled: return "Scheduled"
        }
    }
}
