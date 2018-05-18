import Foundation
import SOSwiftVocabulary

extension EventStatus: AttributedEnum {
    public static var allCases: [EventStatus] {
        return [.cancelled, .postponed, .rescheduled, .scheduled]
    }
    
    public var displayName: String {
        switch self {
        case .cancelled: return "Cancelled"
        case .postponed: return "Postponed"
        case .rescheduled: return "Rescheduled"
        case .scheduled: return "Scheduled"
        }
    }
}
