import Foundation

/// A business entity type is a conceptual entity representing the legal form,
/// the size, the main line of business, the position in the value chain, or any
/// combination thereof, of an organization or business person.
public enum BusinessEntityType: String {
    case business = "Business"
    case endUser = "Enduser"
    case publicInstitution = "PublicInstitution"
    case reseller = "Reseller"
    
    public var displayValue: String {
        switch self {
        case .business: return "Business"
        case .endUser: return "End User"
        case .publicInstitution: return "Public Institution"
        case .reseller: return "Reseller"
        }
    }
}
