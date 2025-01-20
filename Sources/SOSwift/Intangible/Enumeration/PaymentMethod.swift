import Foundation

/// A payment method is a standardized procedure for transferring the monetary amount for a purchase. Payment methods are characterized by the legal and technical structures used, and by the organization or group carrying out the transaction.
public enum PaymentMethod: String, CaseIterable, Codable {
    case byBankTransferInAdvance = "ByBankTransferInAdvance"
    case byInvoice = "ByInvoice"
    case cash = "Cash"
    case checkInAdvance = "CheckInAdvance"
    case cod = "COD"
    case directDebit = "DirectDebit"
    case googleCheckout = "GoogleCheckout"
    case payPal = "PayPal"
    case paySwarm = "PaySwarm"

    public var displayValue: String {
        switch self {
        case .byBankTransferInAdvance: "By Bank Transfer (In Advance)"
        case .byInvoice: "By Invoice"
        case .cash: "Cash"
        case .checkInAdvance: "Check (In Advance)"
        case .cod: "Cash/Check On Delivery"
        case .directDebit: "Direct Debit"
        case .googleCheckout: "Google Checkout"
        case .payPal: "PayPal"
        case .paySwarm: "PaySwarm"
        }
    }
}
