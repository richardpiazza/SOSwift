import Foundation

/// A list of possible product availability options.
public enum ItemAvailability: String {
    case discontinued = "Discontinued"
    case inStock = "InStock"
    case inStoreOnly = "InStoreOnly"
    case limitedAvailability = "LimitedAvailability"
    case onlineOnly = "OnlineOnly"
    case outOfStock = "OutOfStock"
    case preOrder = "PreOrder"
    case preSale = "PreSale"
    case soldOut = "SoldOut"
}
