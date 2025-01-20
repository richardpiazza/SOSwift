import Foundation

/// A financial product for the loaning of an amount of money under agreed terms and charges.
public class LoanOrCredit: FinancialProduct {

    /// The amount of money.
    public var amount: MonetaryAmountOrNumber?

    /// The currency in which the monetary amount is expressed.
    public var currency: String?

    /// The period of time after any due date that the borrower has to fulfil its obligations before a default
    /// (failure to pay) is deemed to have occurred.
    public var gracePeriod: Duration?

    /// A form of paying back money previously borrowed from a lender.
    ///
    /// Repayment usually takes the form of periodic payments that normally include part principal plus interest in each
    /// payment.
    public var loanRepaymentForm: RepaymentSpecification?

    /// The duration of the loan or credit agreement.
    public var loanTerm: QuantitativeValue?

    /// The type of a loan or credit.
    public var loanType: URLOrText?

    /// The only way you get the money back in the event of default is the security.
    ///
    /// Recourse is where you still have the opportunity to go back to the borrower for the rest of the money.
    public var isRecourseLoan: Bool?

    /// Whether the terms for payment of interest can be renegotiated during the life of the loan.
    public var isRenegotiableLoan: Bool?

    /// Assets required to secure loan or credit repayments. It may take form of third party pledge, goods, financial
    /// instruments (cash, securities, etc.)
    public var requiredCollateral: ThingOrText?

    enum LoanOrCreditCodingKeys: String, CodingKey {
        case amount
        case currency
        case gracePeriod
        case loanRepaymentForm
        case loanTerm
        case loanType
        case isRecourseLoan = "recourseLoan"
        case isRenegotiableLoan = "renegotiableLoan"
        case requiredCollateral
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: LoanOrCreditCodingKeys.self)

        amount = try container.decodeIfPresent(MonetaryAmountOrNumber.self, forKey: .amount)
        currency = try container.decodeIfPresent(String.self, forKey: .currency)
        gracePeriod = try container.decodeIfPresent(Duration.self, forKey: .gracePeriod)
        loanRepaymentForm = try container.decodeIfPresent(RepaymentSpecification.self, forKey: .loanRepaymentForm)
        loanTerm = try container.decodeIfPresent(QuantitativeValue.self, forKey: .loanTerm)
        loanType = try container.decodeIfPresent(URLOrText.self, forKey: .loanType)
        isRecourseLoan = try container.decodeIfPresent(Bool.self, forKey: .isRecourseLoan)
        isRenegotiableLoan = try container.decodeIfPresent(Bool.self, forKey: .isRenegotiableLoan)
        requiredCollateral = try container.decodeIfPresent(ThingOrText.self, forKey: .requiredCollateral)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: LoanOrCreditCodingKeys.self)

        try container.encodeIfPresent(amount, forKey: .amount)
        try container.encodeIfPresent(currency, forKey: .currency)
        try container.encodeIfPresent(gracePeriod, forKey: .gracePeriod)
        try container.encodeIfPresent(loanRepaymentForm, forKey: .loanRepaymentForm)
        try container.encodeIfPresent(loanTerm, forKey: .loanTerm)
        try container.encodeIfPresent(loanType, forKey: .loanType)
        try container.encodeIfPresent(isRecourseLoan, forKey: .isRecourseLoan)
        try container.encodeIfPresent(isRenegotiableLoan, forKey: .isRenegotiableLoan)
        try container.encodeIfPresent(requiredCollateral, forKey: .requiredCollateral)

        try super.encode(to: encoder)
    }
}
