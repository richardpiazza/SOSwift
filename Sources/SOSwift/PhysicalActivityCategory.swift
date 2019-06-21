import Foundation

/// Categories of physical activity, organized by physiologic classification.
public enum PhysicalActivityCategory: String, CaseIterable, Codable {
    case aerobic = "AerobicActivity"
    case anaerobic = "AnaerobicActivity"
    case balance = "Balance"
    case flexibility = "Flexibility"
    case leisureTime = "LeisureTimeActivity"
    case occupational = "OccupationalActivity"
    case strengthTraining = "StrengthTraining"
    
    public var displayValue: String {
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
