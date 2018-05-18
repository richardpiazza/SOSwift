import Foundation
import SOSwiftVocabulary

extension Gender: AttributedEnum {
    public static var allCases: [Gender] {
        return [.female, .male]
    }
    
    public var displayName: String {
        switch self {
        case .female: return "Female"
        case .male: return "Male"
        }
    }
}
