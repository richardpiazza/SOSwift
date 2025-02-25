import Foundation

/// An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.
public enum EventStatus: String, CaseIterable, Codable {
    case cancelled = "EventCancelled"
    case postponed = "EventPostponed"
    case rescheduled = "EventRescheduled"
    case scheduled = "EventScheduled"

    public var displayValue: String {
        switch self {
        case .cancelled: "Cancelled"
        case .postponed: "Postponed"
        case .rescheduled: "Rescheduled"
        case .scheduled: "Scheduled"
        }
    }
}
