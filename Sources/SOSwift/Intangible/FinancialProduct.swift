import Foundation

/// A product provided to consumers and businesses by financial institutions such as banks, insurance companies,
/// brokerage firms, consumer finance companies, and investment companies which comprise the financial services
/// industry.
public class FinancialProduct: Service {
    
    /// The annual rate that is charged for borrowing (or made by investing), expressed as a single percentage number
    /// that represents the actual yearly cost of funds over the term of a loan.
    ///
    /// This includes any fees or additional costs associated with the transaction.
    public var annualPercentageRate: NumberOrQuantitativeValue?
    
    /// Description of fees, commissions, and other terms applied either to a class of financial product, or by a
    /// financial service organization.
    public var feesAndCommissionsSpecification: URLOrText?
    
    /// The interest rate, charged or paid, applicable to the financial product.
    ///
    /// - note: This is different from the calculated annualPercentageRate.
    public var interestRate: NumberOrQuantitativeValue?
    
    internal enum FinancialProductCodingKeys: String, CodingKey {
        case annualPercentageRate
        case feesAndCommissionsSpecification
        case interestRate
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: FinancialProductCodingKeys.self)
        
        annualPercentageRate = try container.decodeIfPresent(NumberOrQuantitativeValue.self, forKey: .annualPercentageRate)
        feesAndCommissionsSpecification = try container.decodeIfPresent(URLOrText.self, forKey: .feesAndCommissionsSpecification)
        interestRate = try container.decodeIfPresent(NumberOrQuantitativeValue.self, forKey: .interestRate)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FinancialProductCodingKeys.self)
        
        try container.encodeIfPresent(annualPercentageRate, forKey: .annualPercentageRate)
        try container.encodeIfPresent(feesAndCommissionsSpecification, forKey: .feesAndCommissionsSpecification)
        try container.encodeIfPresent(interestRate, forKey: .interestRate)
        
        try super.encode(to: encoder)
    }
}
