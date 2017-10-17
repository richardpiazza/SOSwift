import Foundation
import SOSwiftVocabulary

/// A structured value providing information about when a certain organization or person owned a certain product.
public class SOOwnershipInfo: SOStructuredValue, OwnershipInfo {
    
    public override class var type: String {
        return "OwnershipInfo"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .acquiredFrom) {
            self.acquiredFrom = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .ownedFrom) {
            self.ownedFrom = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .ownedThrough) {
            self.ownedThrough = value
        }
        if let value = try container.decodeProductOrServiceIfPresent(forKey: .typeOfGood) {
            self.typeOfGood = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.acquiredFrom {
            try container.encodeOrganizationOrPerson(value, forKey: .acquiredFrom)
        }
        if let value = self.ownedFrom {
            try container.encodeDateTime(value, forKey: .ownedFrom)
        }
        if let value = self.ownedThrough {
            try container.encodeDateTime(value, forKey: .ownedThrough)
        }
        if let value = self.typeOfGood {
            try container.encodeProductOrService(value, forKey: .typeOfGood)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
