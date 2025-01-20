import Foundation

/// A range of of services that will be provided to a customer free of charge in
/// case of a defect or malfunction of a product.
public enum WarrantyScope: String, CaseIterable, Codable {
    case bringInLabor = "Labor-BringIn"
    case bringInPartsOrLabor = "PartsAndLabor-BringIn"
    case pickupPartsOrLabor = "PartsAndLabor-PickUp"

    public var displayValue: String {
        switch self {
        case .bringInLabor: "Bring In - Labor Only"
        case .bringInPartsOrLabor: "Bring In - Parts & Labor"
        case .pickupPartsOrLabor: "Pick Up - Parts & Labor"
        }
    }
}
