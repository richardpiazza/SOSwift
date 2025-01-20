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
        case .aerobic: "Aerobic Activity"
        case .anaerobic: "Anaerobic Activity"
        case .balance: "Balance"
        case .flexibility: "Flexibility"
        case .leisureTime: "Leisure Time"
        case .occupational: "Occupational"
        case .strengthTraining: "Strength Training"
        }
    }
}
