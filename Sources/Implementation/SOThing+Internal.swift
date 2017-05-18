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
    
    /// Initialize `AdministrativeArea`, `GeoShape`, `Place`, or `String`
    internal func makeAreaServed(anyObject: AnyObject) -> AreaServed? {
        if let typedValue = anyObject as? [String : AnyObject] {
            if typedValue[Keys.type] as? String == SOAdministrativeArea.type {
                return SOAdministrativeArea(dictionary: typedValue)
            } else if typedValue[Keys.type] as? String == SOGeoShape.type {
                return SOGeoShape(dictionary: typedValue)
            } else if typedValue[Keys.type] as? String == SOPlace.type {
                return SOPlace(dictionary: typedValue)
            }
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize `Brand` or `Organization`
    internal func makeBrandOrOrganization(dictionary: [String : AnyObject]) -> BrandOrOrganization? {
        if dictionary[Keys.type] as? String == SOBrand.type {
            return SOBrand(dictionary: dictionary)
        } else if dictionary[Keys.type] as? String == SOOrganization.type {
            return SOOrganization(dictionary: dictionary)
        }
        
        return nil
    }
    
    /// Initialize [`BrandOrOrganization`]
    internal func makeBrandOrOgranizations(anyObject: AnyObject) -> [BrandOrOrganization] {
        var array = [BrandOrOrganization]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                if let item = makeBrandOrOrganization(dictionary: element) {
                    array.append(item)
                }
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            if let item = makeBrandOrOrganization(dictionary: typedValue) {
                array.append(item)
            }
        }
        return array
    }
    
    /// Initialize [`ContactPoint`]
    internal func makeContactPoints(anyObject: AnyObject) -> [ContactPoint] {
        var array = [ContactPoint]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                array.append(SOContactPoint(dictionary: element))
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            array.append(SOContactPoint(dictionary: typedValue))
        }
        return array
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
    
    /// Initialize [`Demand`]
    internal func makeDemands(anyObject: AnyObject) -> [Demand] {
        var array = [Demand]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                array.append(SODemand(dictionary: element))
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            array.append(SODemand(dictionary: typedValue))
        }
        return array
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
    
    /// Initialize [`Event`]
    internal func makeEvents(anyObject: AnyObject) -> [Event] {
        var array = [Event]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                array.append(SOEvent(dictionary: element))
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            array.append(SOEvent(dictionary: typedValue))
        }
        return array
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
    
    /// Initialize [`OrganizationOrPerson`]
    internal func makeOrganizationOrPersons(anyObject: AnyObject) -> [OrganizationOrPerson] {
        var array = [OrganizationOrPerson]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                if let item = makeOrganizationOrPerson(dictionary: element) {
                    array.append(item)
                }
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            if let item = makeOrganizationOrPerson(dictionary: typedValue) {
                array.append(item)
            }
        }
        return array
    }
    
    /// Initialize `Organization` or `ProgramMembership`
    internal func makeOrganizationOrProgramMembership(dictionary: [String : AnyObject]) -> OrganizationOrProgramMembership? {
        if dictionary[Keys.type] as? String == SOOrganization.type {
            return SOOrganization(dictionary: dictionary)
        } else if dictionary[Keys.type] as? String == SOProgramMembership.type {
            return SOProgramMembership(dictionary: dictionary)
        }
        
        return nil
    }
    
    /// Initialize [`OwnershipInfoOrProduct`]
    internal func makeOwnershipInfoOrProducts(elements: [[String : AnyObject]]) -> [OwnershipInfoOrProduct] {
        var array = [OwnershipInfoOrProduct]()
        for element in elements {
            if element[Keys.type] as? String == SOOwnershipInfo.type {
                array.append(SOOwnershipInfo(dictionary: element))
            } else if element[Keys.type] as? String == SOProduct.type {
                array.append(SOProduct(dictionary: element))
            }
        }
        return array
    }
    
    /// Initialize [`Person`]
    internal func makePersons(anyObject: AnyObject) -> [Person] {
        var array = [Person]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                array.append(SOPerson(dictionary: element))
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            array.append(SOPerson(dictionary: typedValue))
        }
        return array
    }
    
    /// Initialize `Place`, `PostalAddress`, or `Text`
    internal func makePlaceOrPostalAddressOrText(anyObject: AnyObject) -> PlaceOrPostalAddressOrText? {
        if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOPlace.type {
            return SOPlace(dictionary: typedValue)
        } else if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOPostalAddress.type {
            return SOPostalAddress(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize [`Place`]
    internal func makePlaces(anyObject: AnyObject) -> [Place] {
        var array = [Place]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                array.append(SOPlace(dictionary: element))
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            array.append(SOPlace(dictionary: typedValue))
        }
        return array
    }
    
    /// Initialize `PostalAddress` or `String`
    internal func makePostalAddressOrText(anyObject: AnyObject) -> PostalAddressOrText? {
        if let typedValue = anyObject as? [String : AnyObject] {
            return SOPostalAddress(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return typedValue
        }
        
        return nil
    }
    
    /// Initialize `Product`, `String`, or `URL`
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
    
    /// Initialize [`Review`]
    internal func makeReviews(anyObject: AnyObject) -> [Review] {
        var array = [Review]()
        if let typedValue = anyObject as? [[String : AnyObject]] {
            for element in typedValue {
                array.append(SOReview(dictionary: element))
            }
        } else if let typedValue = anyObject as? [String : AnyObject] {
            array.append(SOReview(dictionary: typedValue))
        }
        return array
    }
    
    /// Initialize [`String`]
    internal func makeStrings(anyObject: AnyObject) -> [String] {
        var array = [String]()
        if let typedValue = anyObject as? [String] {
            array.append(contentsOf: typedValue)
        } else if let typedValue = anyObject as? String {
            array.append(typedValue)
        }
        return array
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

