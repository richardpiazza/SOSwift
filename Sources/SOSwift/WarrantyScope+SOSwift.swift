import Foundation
import SOSwiftVocabulary

extension WarrantyScope: AttributedEnum {
    public static var allCases: [WarrantyScope] {
        return [.bringInLabor, .bringInPartsOrLabor, .pickupPartsOrLabor]
    }
    
    public var displayName: String {
        switch self {
        case .bringInLabor: return "Bring In - Labor Only"
        case .bringInPartsOrLabor: return "Bring In - Parts & Labor"
        case .pickupPartsOrLabor: return "Pick Up - Parts & Labor"
        }
    }
}
