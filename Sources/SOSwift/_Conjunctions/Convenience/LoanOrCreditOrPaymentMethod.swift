public typealias LoanOrCreditOrPaymentMethod = SingleSchemaCodableConjunction<LoanOrCredit, PaymentMethod>

public extension LoanOrCreditOrPaymentMethod {
    var loanOrCredit: LoanOrCredit? { first }
    var paymentMethod: PaymentMethod? { second }
}
