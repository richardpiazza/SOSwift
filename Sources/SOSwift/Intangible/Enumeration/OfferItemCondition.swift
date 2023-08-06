import Foundation

public enum OfferItemCondition: String, CaseIterable, Codable {
    case damaged = "DamagedCondition"
    case new = "NewCondition"
    case refurbished = "RefurbishedCondition"
    case used = "UsedCondition"
    
    public var displayValue: String {
        switch self {
        case .damaged: return "Damaged"
        case .new: return "New"
        case .refurbished: return "Refurbished"
        case .used: return "Used"
        }
    }
}
