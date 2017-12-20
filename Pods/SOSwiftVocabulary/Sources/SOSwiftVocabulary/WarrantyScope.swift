import Foundation

/// A range of of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.
public enum WarrantyScope: String {
    case bringInLabor = "Labor-BringIn"
    case bringInPartsOrLabor = "PartsAndLabor-BringIn"
    case pickupPartsOrLabor = "PartsAndLabor=PickUp"
}
