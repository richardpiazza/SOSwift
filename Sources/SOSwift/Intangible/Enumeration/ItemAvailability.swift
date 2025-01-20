import Foundation

/// A list of possible product availability options.
public enum ItemAvailability: String, CaseIterable, Codable {
    case discontinued = "Discontinued"
    case inStock = "InStock"
    case inStoreOnly = "InStoreOnly"
    case limitedAvailability = "LimitedAvailability"
    case onlineOnly = "OnlineOnly"
    case outOfStock = "OutOfStock"
    case preOrder = "PreOrder"
    case preSale = "PreSale"
    case soldOut = "SoldOut"

    public var displayValue: String {
        switch self {
        case .discontinued: "Discontinued"
        case .inStock: "In Stock"
        case .inStoreOnly: "In Store Only"
        case .limitedAvailability: "Limited Availability"
        case .onlineOnly: "Online Only"
        case .outOfStock: "Out of Stock"
        case .preOrder: "Pre-Order"
        case .preSale: "Pre-Sale"
        case .soldOut: "Sold Out"
        }
    }
}
