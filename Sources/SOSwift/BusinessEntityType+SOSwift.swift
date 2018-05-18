import Foundation
import SOSwiftVocabulary

extension BusinessEntityType: AttributedEnum {
    public static var allCases: [BusinessEntityType] {
        return [.business, .endUser, .publicInstitution, .reseller]
    }
    
    public var displayName: String {
        switch self {
        case .business: return "Business"
        case .endUser: return "End User"
        case .publicInstitution: return "Public Institution"
        case .reseller: return "Reseller"
        }
    }
}
