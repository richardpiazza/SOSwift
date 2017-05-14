import Foundation

/// Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.
public class SOStructuredValue: SOIntangible, StructuredValue {
    override public class var type: String {
        return "StructuredValue"
    }
    
    override public class var specificTypes: [Thing.Type] {
        return [SOContactPoint.self, SOGeoCoordinates.self, SOGeoShape.self, SOInteractionCounter.self, SOMonetaryAmount.self,
                SOOpeningHoursSpecification.self, SOOwnershipInfo.self, SOPriceSpecification.self, SOPropertyValue.self,
                SOQuantitativeValue.self]
    }
}
