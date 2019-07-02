import Foundation

public class WarrantyPromise: Thing {
    
    /// The duration of the warranty promise. Common unitCode values are ANN for
    /// year, MON for months, or DAY for days.
    public var durationOfWarranty: QuantitativeValue?
    
    /// The scope of the warranty promise.
    public var warrantyScope: WarrantyScope?
    
    internal enum WarrantyPromiseCodingKeys: String, CodingKey {
        case durationOfWarranty
        case warrantScope
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: WarrantyPromiseCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: WarrantyPromiseCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
