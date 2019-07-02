import Foundation

/// A structured value indicating the quantity, unit of measurement, and business
/// function of goods included in a bundle offer.
public class TypeAndQuantityNode: StructuredValue {
    
    /// The quantity of the goods included in the offer.
    public var amountOfThisGood: Number?
    
    /// The business function (e.g. sell, lease, repair, dispose)
    /// of the offer or component of a bundle (TypeAndQuantityNode).
    /// The default is [http://purl.org/goodrelations/v1#Sell](http://purl.org/goodrelations/v1#Sell).
    public var businessFunction: BusinessFunction?
    
    /// The product that this structured value is referring to.
    public var typeOfGood: ProductOrService?
    
    /// The unit of measurement given using the UN/CEFACT Common
    /// Code (3 characters) or a URL. Other codes than the UN/CEFACT
    /// Common Code may be used with a prefix followed by a colon.
    public var unitCode: URLOrText?
    
    /// A string or text indicating the unit of measurement. Useful if you
    /// cannot provide a standard unit code for unitCode.
    public var unitText: String?
    
    internal enum TypeAndQuantityNodeCodingKeys: String, CodingKey {
        case amountOfThisGood
        case businessFunction
        case typeOfGood
        case unitCode
        case unitText
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: TypeAndQuantityNodeCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TypeAndQuantityNodeCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
