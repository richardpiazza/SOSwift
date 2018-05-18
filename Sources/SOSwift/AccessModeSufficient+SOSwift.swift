import Foundation
import SOSwiftVocabulary

extension AccessModeSufficient: AttributedEnum {
    public static var allCases: [AccessModeSufficient] {
        return [.auditory, .tactile, .textual, .visual]
    }
    
    public var displayName: String {
        switch self {
        case .auditory: return "Auditory"
        case .tactile: return "Tactile"
        case .textual: return "Textual"
        case .visual: return "Visual"
        }
    }
}
