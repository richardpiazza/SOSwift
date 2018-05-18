import Foundation
import SOSwiftVocabulary

extension Interactivity: AttributedEnum {
    public static var allCases: [Interactivity] {
        return [.active, .expositive, .mixed]
    }
    
    public var displayName: String {
        switch self {
        case .active: return "Active"
        case .expositive: return "Expositive"
        case .mixed: return "Mixed"
        }
    }
}
