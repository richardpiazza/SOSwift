import Foundation

public enum OfferItemCondition: String, CaseIterable, Codable {
    case damaged = "DamagedCondition"
    case new = "NewCondition"
    case refurbished = "RefurbishedCondition"
    case used = "UsedCondition"

    public var displayValue: String {
        switch self {
        case .damaged: "Damaged"
        case .new: "New"
        case .refurbished: "Refurbished"
        case .used: "Used"
        }
    }
}
