import Foundation

/// Enumerated for values for itemListOrder for indicating how an ordered ItemList is organized.
public enum ItemListOrder: String, CaseIterable, Codable {
    case ascending = "ItemListOrderAscending"
    case descending = "ItemListOrderDescending"
    case unordered = "ItemListUnordered"

    public var displayValue: String {
        switch self {
        case .ascending: "Ascending"
        case .descending: "Descending"
        case .unordered: "Unordered"
        }
    }
}
