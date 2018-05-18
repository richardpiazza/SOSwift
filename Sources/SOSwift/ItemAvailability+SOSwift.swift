import Foundation
import SOSwiftVocabulary

extension ItemAvailability: AttributedEnum {
    public static var allCases: [ItemAvailability] {
        return [.discontinued, .inStock, .inStoreOnly, .limitedAvailability, .onlineOnly, .outOfStock, .preOrder, .preSale, .soldOut]
    }
    
    public var displayName: String {
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
