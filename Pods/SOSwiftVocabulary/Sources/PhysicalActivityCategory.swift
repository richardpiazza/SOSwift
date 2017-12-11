import Foundation

/// Categories of physical activity, organized by physiologic classification.
public enum PhysicalActivityCategory: String, PhysicalActivityCategoryOrThingOrText {
    case aerobic = "AerobicActivity"
    case anaerobic = "AnaerobicActivity"
    case balance = "Balance"
    case flexibility = "Flexibility"
    case leisureTime = "LeisureTimeActivity"
    case occupational = "OccupationalActivity"
    case strengthTraining = "StrengthTraining"
}
