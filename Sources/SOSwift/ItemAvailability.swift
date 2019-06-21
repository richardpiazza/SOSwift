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
        case .discontinued: return "Discontinued"
        case .inStock: return "In Stock"
        case .inStoreOnly: return "In Store Only"
        case .limitedAvailability: return "Limited Availability"
        case .onlineOnly: return "Online Only"
        case .outOfStock: return "Out of Stock"
        case .preOrder: return "Pre-Order"
        case .preSale: return "Pre-Sale"
        case .soldOut: return "Sold Out"
        }
    }
}
