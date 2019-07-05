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
        case .byBankTransferInAdvance: return "By Bank Transfer (In Advance)"
        case .byInvoice: return "By Invoice"
        case .cash: return "Cash"
        case .checkInAdvance: return "Check (In Advance)"
        case .cod: return "Cash/Check On Delivery"
        case .directDebit: return "Direct Debit"
        case .googleCheckout: return "Google Checkout"
        case .payPal: return "PayPal"
        case .paySwarm: return "PaySwarm"
        }
    }
}

