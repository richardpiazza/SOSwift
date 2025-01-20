import Foundation

/// A delivery method is a standardized procedure for transferring the product or service to the destination of
/// fulfillment chosen by the customer.
///
/// Delivery methods are characterized by the means of transportation used, and by the organization or group that is the
/// contracting party for the sending organization or person.
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
        case .directDownload: "Direct Download"
        case .frieght: "Frieght"
        case .mail: "Postal"
        case .ownFleet: "Own Fleet"
        case .pickUp: "Pick Up"
        case .dhl: "DHL"
        case .federalExpress: "FedEX"
        case .ups: "UPS"
        }
    }
}
