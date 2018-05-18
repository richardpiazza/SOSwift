import Foundation
import SOSwiftVocabulary

extension DeliveryMethod: AttributedEnum {
    public static var allCases: [DeliveryMethod] {
        return [.directDownload, .frieght, .mail, .ownFleet, .pickUp, .dhl, .federalExpress, .ups]
    }
    
    public var displayName: String {
        switch self {
        case .directDownload: return "Direct Download"
        case .frieght: return "Frieght"
        case .mail: return "Postal"
        case .ownFleet: return "Own Fleet"
        case .pickUp: return "Pick Up"
        case .dhl: return "DHL"
        case .federalExpress: return "FedEX"
        case .ups: return "UPS"
        }
    }
}
