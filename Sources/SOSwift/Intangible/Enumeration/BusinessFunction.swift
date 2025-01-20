import Foundation

/// The business function specifies the type of activity or access (i.e., the bundle of rights) offered by the
/// organization or business person through the offer.
///
/// Typical are sell, rental or lease, maintenance or repair, manufacture / produce, recycle / dispose, engineering /
/// construction, or installation. Proprietary specifications of access rights are also instances of this class.
public enum BusinessFunction: String, CaseIterable, Codable {
    case constructionInstallation = "ConstructionInstallation"
    case dispose = "Dispose"
    case leaseOut = "LeaseOut"
    case maintain = "Maintain"
    case provideService = "ProvideService"
    case repair = "Repair"
    case sell = "Sell"
    case buy = "Buy"

    public var displayValue: String {
        switch self {
        case .constructionInstallation: "Construction Installation"
        case .dispose: "Dispose"
        case .leaseOut: "Lease Out"
        case .maintain: "Maintain"
        case .provideService: "Provide Service"
        case .repair: "Repair"
        case .sell: "Sell"
        case .buy: "Buy"
        }
    }
}
