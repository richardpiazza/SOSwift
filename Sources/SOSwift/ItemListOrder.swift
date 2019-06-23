import Foundation

/// Enumerated for values for itemListOrder for indicating how an
/// ordered ItemList is organized.
public enum ItemListOrder: String, CaseIterable, Codable {
    case ascending = "ItemListOrderAscending"
    case decending = "ItemListOrderDescending"
    case unordered = "ItemListUnordered"
    
    public var displayValue: String {
        switch self {
        case .ascending: return "Ascending"
        case .decending: return "Descending"
        case .unordered: return "Unordered"
        }
    }
}
