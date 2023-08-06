import Foundation
import CodablePlus

public enum LoanOrCreditOrPaymentMethod: Codable {
    case loanOrCredit(value: LoanOrCredit)
    case paymentMethod(value: PaymentMethod)
    
    public init(_ value: LoanOrCredit) {
        self = .loanOrCredit(value: value)
    }
    
    public init(_ value: PaymentMethod) {
        self = .paymentMethod(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(PaymentMethod.self)
            self = .paymentMethod(value: value)
            return
        }
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case LoanOrCredit.schemaName:
            let value = try container.decode(LoanOrCredit.self)
            self = .loanOrCredit(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .loanOrCredit(let value):
            try container.encode(value)
        case .paymentMethod(let value):
            try container.encode(value)
        }
    }
    
    public var loanOrCredit: LoanOrCredit? {
        switch self {
        case .loanOrCredit(let value):
            return value
        default:
            return nil
        }
    }
    
    public var paymentMethod: PaymentMethod? {
        switch self {
        case .paymentMethod(let value):
            return value
        default:
            return nil
        }
    }
}
