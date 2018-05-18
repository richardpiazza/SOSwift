import Foundation
import SOSwiftVocabulary

extension ActionStatus: AttributedEnum {
    public static var allCases: [ActionStatus] {
        return [.active, .completed, .failed, .potential]
    }
    
    public var displayName: String {
        switch self {
        case .active: return "Active"
        case .completed: return "Completed"
        case .failed: return "Failed"
        case .potential: return "Potential"
        }
    }
}
