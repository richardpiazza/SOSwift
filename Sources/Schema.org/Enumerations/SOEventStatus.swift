import Foundation

public enum EventStatus: String {
    case cancelled = "EventCancelled"
    case postponed = "EventPostponed"
    case rescheduled = "EventRescheduled"
    case scheduled = "EventScheduled"
}
