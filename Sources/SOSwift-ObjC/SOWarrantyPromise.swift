import Foundation
import SOSwiftVocabulary_ObjC

public class SOWarrantyPromise: SOThing, WarrantyPromise {
    
    public override class var type: String {
        return "WarrantyPromise"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The duration of the warranty promise. Common unitCode values are ANN for year, MON for months, or DAY for days.
    public var durationOfWarranty: QuantitativeValue?
    /// The scope of the warranty promise.
    public var warrantyScopeRawValue: NSNumber?
    
    private enum CodingKeys: String, CodingKey {
        case durationOfWarranty
        case warrantyScope
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.durationOfWarranty = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .durationOfWarranty)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .warrantyScope) {
            self.warrantyScope = WarrantyScope(stringValue: rawValue)
        }
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.durationOfWarranty, forKey: .durationOfWarranty)
        try container.encodeIfPresent(self.warrantyScope?.stringValue, forKey: .warrantyScope)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: WarrantyPromise?, forKey key: K) throws {
        if let typedValue = value as? SOWarrantyPromise {
            try self.encode(typedValue, forKey: key)
        }
    }
}
