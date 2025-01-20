import Foundation

/// A structured value representing repayment.
///
/// This term is proposed for full integration into Schema.org, pending implementation feedback and adoption from
/// applications and websites.
public class RepaymentSpecification: StructuredValue {

    /// A type of payment made in cash during the onset of the purchase of an expensive good/service.
    ///
    /// The payment typically represents only a percentage of the full purchase price.
    public var downPayment: MonetaryAmountOrNumber?

    /// The amount to be paid as a penalty in the event of early payment of the loan.
    public var earlyPrepaymentPenalty: MonetaryAmount?

    /// The amount of money to pay in a single payment.
    public var loanPaymentAmount: MonetaryAmount?

    /// Frequency of payments due, i.e. number of months between payments.
    ///
    /// This is defined as a frequency, i.e. the reciprocal of a period of time.
    public var loanPaymentFrequency: Number?

    /// The number of payments contractually required at origination to repay the loan.
    ///
    /// For monthly paying loans this is the number of months from the contractual first payment date to the maturity
    /// date.
    public var numberOfLoanPayments: Number?

    enum RepaymentSpecificationCodingKeys: String, CodingKey {
        case downPayment
        case earlyPrepaymentPenalty
        case loanPaymentAmount
        case loanPaymentFrequency
        case numberOfLoansPayments
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: RepaymentSpecificationCodingKeys.self)

        downPayment = try container.decodeIfPresent(MonetaryAmountOrNumber.self, forKey: .downPayment)
        earlyPrepaymentPenalty = try container.decodeIfPresent(MonetaryAmount.self, forKey: .earlyPrepaymentPenalty)
        loanPaymentAmount = try container.decodeIfPresent(MonetaryAmount.self, forKey: .loanPaymentAmount)
        loanPaymentFrequency = try container.decodeIfPresent(Number.self, forKey: .loanPaymentFrequency)
        numberOfLoanPayments = try container.decodeIfPresent(Number.self, forKey: .numberOfLoansPayments)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RepaymentSpecificationCodingKeys.self)

        try container.encodeIfPresent(downPayment, forKey: .downPayment)
        try container.encodeIfPresent(earlyPrepaymentPenalty, forKey: .earlyPrepaymentPenalty)
        try container.encodeIfPresent(loanPaymentAmount, forKey: .loanPaymentAmount)
        try container.encodeIfPresent(loanPaymentFrequency, forKey: .loanPaymentFrequency)
        try container.encodeIfPresent(numberOfLoanPayments, forKey: .numberOfLoansPayments)

        try super.encode(to: encoder)
    }
}
