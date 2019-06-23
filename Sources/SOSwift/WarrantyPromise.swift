import Foundation

public class WarrantyPromise: Thing {
    
    /// The duration of the warranty promise. Common unitCode values are ANN for
    /// year, MON for months, or DAY for days.
    public var durationOfWarranty: QuantitativeValue?
    
    /// The scope of the warranty promise.
    public var warrantyScope: WarrantyScope?
    
}
