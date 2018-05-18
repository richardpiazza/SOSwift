import Foundation
import SOSwiftVocabulary

extension PhysicalActivityCategory: AttributedEnum {
    public static var allCases: [PhysicalActivityCategory] {
        return [.aerobic, .anaerobic, .balance, .flexibility, .leisureTime, .occupational, .strengthTraining]
    }
    
    public var displayName: String {
        switch self {
        case .aerobic: return "Aerobic Activity"
        case .anaerobic: return "Anaerobic Activity"
        case .balance: return "Balance"
        case .flexibility: return "Flexibility"
        case .leisureTime: return "Leisure"
        case .occupational: return "Occupational"
        case .strengthTraining: return "Strength Training"
        }
    }
}
