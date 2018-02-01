import Foundation
import SOSwiftVocabulary_ObjC

/// A utility class that serves as the umbrella for a number of 'intangible' things such as quantities, structured values, etc.
public class SOIntangible: SOThing, Intangible {
    
    public override class var type: String {
        return "Intangible"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOAlignmentObject.self,
            SOBrand.self,
            SODemand.self,
            SOEntryPoint.self,
            SOEnumeration.self,
            SOItemList.self,
            SOLanguage.self,
            SOListItem.self,
            SOOccupation.self,
            SOOffer.self,
            SOProgramMembership.self,
            SOQuantity.self,
            SORating.self,
            SOService.self,
            SOServiceChannel.self,
            SOStructuredValue.self
        ]
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Intangible?, forKey key: K) throws {
        if let typedValue = value as? SOIntangible {
            try self.encode(typedValue, forKey: key)
        }
    }
}
