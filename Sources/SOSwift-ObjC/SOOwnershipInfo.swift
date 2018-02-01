import Foundation
import SOSwiftVocabulary_ObjC

/// A structured value providing information about when a certain organization or person owned a certain product.
public class SOOwnershipInfo: SOStructuredValue, OwnershipInfo {
    
    public override class var type: String {
        return "OwnershipInfo"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The organization or person from which the product was acquired.
    public var acquiredFrom: OrganizationOrPerson?
    /// The date and time of obtaining the product.
    public var ownedFrom: DateTime?
    /// The date and time of giving up ownership on the product.
    public var ownedThrough: DateTime?
    /// The product that this structured value is referring to.
    public var typeOfGood: ProductOrService?
    
    private enum CodingKeys: String, CodingKey {
        case acquiredFrom
        case ownedFrom
        case ownedThrough
        case typeOfGood
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.acquiredFrom = try container.decodeOrganizationOrPersonIfPresent(forKey: .acquiredFrom)
        self.ownedFrom = try container.decodeDateTimeIfPresent(forKey: .ownedFrom)
        self.ownedThrough = try container.decodeDateTimeIfPresent(forKey: .ownedThrough)
        self.typeOfGood = try container.decodeProductOrServiceIfPresent(forKey: .typeOfGood)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.acquiredFrom, forKey: .acquiredFrom)
        try container.encodeIfPresent(self.ownedFrom, forKey: .ownedFrom)
        try container.encodeIfPresent(self.ownedThrough, forKey: .ownedThrough)
        try container.encodeIfPresent(self.typeOfGood, forKey: .typeOfGood)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: OwnershipInfo?, forKey key: K) throws {
        if let typedValue = value as? SOOwnershipInfo {
            try self.encode(typedValue, forKey: key)
        }
    }
}
