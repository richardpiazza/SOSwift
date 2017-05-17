import Foundation

public extension SOThing {
    /// Initialize an `AlignmentObject`, `Course`, or `String`
    internal func makeAlignmentObjectOrCourseOrText(anyObject: AnyObject) -> AlignmentObjectOrCourseOrText? {
        if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOAlignmentObject.type {
            return SOAlignmentObject(dictionary: typedValue)
        } else if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOCourse.type {
            return SOCourse(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a `CreativeWork`, `Product`, or `String`
    internal func makeCreativeWorkOrProductOrText(anyObject: AnyObject) -> CreativeWorkOrProductOrURL? {
        if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOCreativeWork.type {
            return SOCreativeWork(dictionary: typedValue)
        } else if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOProduct.type {
            return SOProduct(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return URL(string: typedValue)
        }
        
        return nil
    }
    
    /// Initialize a `CreativeWork` or `String`
    internal func makeCreativeWorkOrText(anyObject: AnyObject) -> CreativeWorkOrText? {
        if let typedValue = anyObject as? [String : AnyObject] {
            return SOCreativeWork(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize an `CreativeWork` or `URL`
    internal func makeCreativeWorkOrURL(anyObject: AnyObject) -> CreativeWorkOrURL? {
        if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOCreativeWork.type {
            return SOCreativeWork(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return URL(string: typedValue)
        }
        
        return nil
    }
    
    /// Initialize a `DateTime`, `String`, or `URL`
    internal func makeDateTimeOrTextOrURL(anyObject: AnyObject) -> DateTimeOrTextOrURL? {
        if let typedValue = anyObject as? String, typedValue.contains("://") {
            return URL(string: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a `Distance` or `QuantitativeValue`
    internal func makeDistanceOrQuantitativeValue(dictionary: [String : AnyObject]) -> DistanceOrQuantitativeValue? {
        if dictionary[Keys.type] as? String == SODistance.type {
            return SODistance(dictionary: dictionary)
        } else if dictionary[Keys.type] as? String == SOQuantitativeValue.type {
            return SOQuantitativeValue(dictionary: dictionary)
        }
        
        return nil
    }
    
    /// Initialize an `Identifier`
    internal func makeIdentifier(anyObject: AnyObject) -> Identifier? {
        if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOPropertyValue.type {
            return SOPropertyValue(dictionary: typedValue)
        } else if let typedValue = anyObject as? String, typedValue.contains("://") {
            return URL(string: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize an `ImageObject` or `URL`
    internal func makeImageObjectOrURL(anyObject: AnyObject) -> ImageObjectOrURL? {
        if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOImageObject.type {
            return SOImageObject(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return URL(string: typedValue)
        }
        
        return nil
    }
    
    /// Initialize an `Int` or `String`
    internal func makeIntegerOrText(anyObject: AnyObject) -> IntegerOrText? {
        if let typedValue = anyObject as? Int {
            return typedValue
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a `Language` or `String`
    internal func makeLanguageOrText(anyObject: AnyObject) -> LanguageOrText? {
        if let typedValue = anyObject as? [String : AnyObject] {
            return SOLanguage(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a `MusicGroup` or `Person`
    internal func makeMusicGroupOrPerson(dictionary: [String : AnyObject]) -> MusicGroupOrPerson? {
        if dictionary[Keys.type] as? String == SOMusicGroup.type {
            return SOMusicGroup(dictionary: dictionary)
        } else if dictionary[Keys.type] as? String == SOPerson.type {
            return SOPerson(dictionary: dictionary)
        }
        
        return nil
    }
    
    /// Initialize an `Int` or `Float`
    internal func makeNumber(anyObject: AnyObject) -> Number? {
        if let typedValue = anyObject as? Int {
            return typedValue
        } else if let typedValue = anyObject as? Float {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a single `Offer` or array or `Offer`
    internal func makeOffers(anyObject: AnyObject) -> [Offer]? {
        var offers: [Offer]
        if let typedValue = anyObject as? [String : AnyObject] {
            offers = [SOOffer(dictionary: typedValue)]
        } else if let typedValue = anyObject as? [[String : AnyObject]] {
            offers = []
            for element in typedValue {
                offers.append(SOOffer(dictionary: element))
            }
        } else {
            return nil
        }
        
        return offers
    }
    
    /// Initialize an `Organization` or `Person`
    internal func makeOrganizationOrPerson(dictionary: [String : AnyObject]) -> OrganizationOrPerson? {
        if dictionary[Keys.type] as? String == SOOrganization.type {
            return SOOrganization(dictionary: dictionary)
        } else if dictionary[Keys.type] as? String == SOPerson.type {
            return SOPerson(dictionary: dictionary)
        }
        
        return nil
    }
    
    /// Initialized `Product`, `String`, or `URL`
    internal func makeProductOrTextOrURL(anyObject: AnyObject) -> ProductOrTextOrURL? {
        if let typedValue = anyObject as? [String : AnyObject] {
            return SOProduct(dictionary: typedValue)
        } else if let typedValue = anyObject as? String, typedValue.contains("://") {
            return URL(string: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialze a `PropertyValue` or `String`
    internal func makePropertyValueOrText(anyObject: AnyObject) -> PropertyValueOrText? {
        if let typedValue = anyObject as? [String : AnyObject] {
            return SOPropertyValue(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a `String` or `URL`
    internal func makeTextOrURL(anyObject: AnyObject) -> TextOrURL? {
        if let typedValue = anyObject as? String, typedValue.contains("://") {
            return URL(string: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a `Value`
    internal func makeValue(anyObject: AnyObject) -> Value? {
        if let typedValue = anyObject as? [String : AnyObject], let typeName = typedValue[SOThing.Keys.type] as? String {
            for typeClass in SOStructuredValue.specificTypes {
                if typeClass.type == typeName {
                    return typeClass.make(dictionary: typedValue) as? Value
                }
            }
        } else if let typedValue = anyObject as? Float {
            return typedValue
        } else if let typedValue = anyObject as? Int {
            return typedValue
        } else if let typedValue = anyObject as? Bool {
            return typedValue
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize a `ReferenceValue`
    internal func makeValueReference(anyObject: AnyObject) -> ValueReference? {
        if let typedValue = anyObject as? [String : AnyObject], let typeName = typedValue[SOThing.Keys.type] as? String {
            for typeClass in SOStructuredValue.specificTypes {
                if typeClass.type == typeName {
                    return typeClass.make(dictionary: typedValue) as? ValueReference
                }
            }
            for typeClass in SOEnumeration.specificTypes {
                if typeClass.type == typeName {
                    return typeClass.make(dictionary: typedValue) as? ValueReference
                }
            }
        }
        
        return nil
    }
    
    
}

