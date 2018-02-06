import Foundation
import SOSwiftVocabulary

/// A structured value indicating the quantity, unit of measurement, and business function of goods included in a bundle offer.
public class SOTypeAndQuantityNode: SOStructuredValue, TypeAndQuantityNode {
    
    public override class var type: String {
        return "TypeAndQuantityNode"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The quantity of the goods included in the offer.
    public var amountOfThisGood: Number?
    /// The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.
    public var businessFunction: BusinessFunction?
    /// The product that this structured value is referring to.
    public var typeOfGood: ProductOrService?
    /// The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
    public var unitCode: URLOrText?
    /// A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for unitCode.
    public var unitText: String?
    
    private enum CodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.amountOfThisGood = try container.decodeNumberIfPresent(forKey: .amountOfThisGood)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .businessFunction) {
            self.businessFunction = BusinessFunction(rawValue: rawValue)
        }
        self.typeOfGood = try container.decodeProductOrServiceIfPresent(forKey: .typeOfGood)
        self.unitCode = try container.decodeURLOrTextIfPresent(forKey: .unitCode)
        self.unitText = try container.decodeIfPresent(String.self, forKey: .unitText)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.amountOfThisGood, forKey: .amountOfThisGood)
        try container.encodeIfPresent(self.businessFunction, forKey: .businessFunction)
        try container.encodeIfPresent(self.typeOfGood, forKey: .typeOfGood)
        try container.encodeIfPresent(self.unitCode, forKey: .unitCode)
        try container.encodeIfPresent(self.unitText, forKey: .unitText)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.amountOfThisGood.rawValue:
            return "The quantity of the goods included in the offer."
        case CodingKeys.businessFunction.rawValue:
            return "The business function of the offer or component of a bundle."
        case CodingKeys.typeOfGood.rawValue:
            return "The product that this structured value is referring to."
        case CodingKeys.unitCode.rawValue:
            return "The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL."
        case CodingKeys.unitText.rawValue:
            return "A string or text indicating the unit of measurement."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.amountOfThisGood.rawValue:
            self.amountOfThisGood = value as? Number
        case CodingKeys.businessFunction.rawValue:
            self.businessFunction = value as? BusinessFunction
        case CodingKeys.typeOfGood.rawValue:
            self.typeOfGood = value as? ProductOrService
        case CodingKeys.unitCode.rawValue:
            self.unitCode = value as? URLOrText
        case CodingKeys.unitText.rawValue:
            self.unitText = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: TypeAndQuantityNode?, forKey key: K) throws {
        if let typedValue = value as? SOTypeAndQuantityNode {
            try self.encode(typedValue, forKey: key)
        }
    }
}

