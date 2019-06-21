import Foundation

/// A delivery method is a standardized procedure for transferring the product
/// or service to the destination of fulfillment chosen by the customer.
/// Delivery methods are characterized by the means of transportation used, and
/// by the organization or group that is the contracting party for the sending
/// organization or person.
public enum DeliveryMethod: String, CaseIterable, Codable {
    case directDownload = "DeliveryModeDirectDownload"
    case frieght = "DeliveryModeFrieght"
    case mail = "DeliveryModeMail"
    case ownFleet = "DeliveryModeOwnFleet"
    case pickUp = "DeliveryModePickUp"
    case dhl = "DHL"
    case federalExpress = "FederalExpress"
    case ups = "UPS"
    
    public var displayValue: String {
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
