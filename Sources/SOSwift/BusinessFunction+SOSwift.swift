import Foundation
import SOSwiftVocabulary

extension BusinessFunction: AttributedEnum {
    public static var allCases: [BusinessFunction] {
        return [.constructionInstallation, .dispose, .leaseOut, .maintain, .provideService, .repair, .sell, .buy]
    }
    
    public var displayName: String {
        switch self {
        case .constructionInstallation: return "Construction Installation"
        case .dispose: return "Dispose"
        case .leaseOut: return "Lease Out"
        case .maintain: return "Maintain"
        case .provideService: return "Provide Service"
        case .repair: return "Repair"
        case .sell: return "Sell"
        case .buy: return "Buy"
        }
    }
}
