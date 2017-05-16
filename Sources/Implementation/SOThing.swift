import Foundation

/// The most generic type of item.
public class SOThing: Thing {
    public struct Keys {
        public static let context = "@context"
        public static let id = "@id"
        public static let type = "@type"
        public static let additionalType = "additionalType"
        public static let alternativeName = "alternativeName"
        public static let description = "description"
        public static let disambiguatingDescription = "disambiguatingDescription"
        public static let identifier = "identifier"
        public static let image = "image"
        public static let mainEntityOfPage = "mainEntityOfPage"
        public static let name = "name"
        public static let potentialAction = "potentialAction"
        public static let sameAs = "sameAs"
        public static let url = "url"
    }
    
    public class var type: String {
        return "Thing"
    }
    
    public class var specificTypes: [Thing.Type] {
        return [SOAction.self, SOCreativeWork.self, SOEvent.self, SOIntangible.self, SOOrganization.self, SOPerson.self, SOPlace.self, SOProduct.self]
    }
    
    /// An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax.
    /// This is a relationship between something and a class that the thing is in.
    /// In RDFa syntax, it is better to use the native RDFa syntax - the 'typeof' attribute - for multiple types.
    /// Schema.org tools may have only weaker understanding of extra types, in particular those defined externally.
    public var additionalType: URL?
    /// An alias for the item.
    public var alternativeName: String?
    /// A description of the item.
    public var description: String?
    /// A sub property of description. A short description of the item used to disambiguate from other, similar items.
    /// Information from other properties (in particular, name) may be necessary for the description to be useful for disambiguation.
    public var disambiguatingDescription: String?
    /// The identifier property represents any kind of identifier for any kind of Thing, such as ISBNs, GTIN codes, UUIDs etc.
    /// Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL (URI) links.
    public var identifier: Identifier?
    /// An image of the item. This can be a URL or a fully described ImageObject.
    public var image: ImageObjectOrURL?
    /// Indicates a page (or other CreativeWork) for which this thing is the main entity being described. Inverse property: mainEntity
    public var mainEntityOfPage: CreativeWorkOrURL?
    /// The name of the item.
    public var name: String?
    /// Indicates a potential Action, which describes an idealized action in which this thing would play an 'object' role.
    public var potentialAction: Action?
    /// URL of a reference Web page that unambiguously indicates the item's identity. E.g. the URL of the item's Wikipedia page, Wikidata entry, or official website.
    public var sameAs: [URL]?
    /// URL of the item.
    public var url: URL?
    
    public convenience init() {
        self.init(dictionary: [String : AnyObject]())
    }
    
    public convenience init(json: String) {
        guard let data = json.data(using: .utf8) else {
            self.init(dictionary: [String : AnyObject]())
            return
        }
        
        var dictionary: [String : AnyObject]
        do {
            if let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : AnyObject] {
                dictionary = object
            } else {
                dictionary = [String : AnyObject]()
            }
        } catch {
            dictionary = [String : AnyObject]()
        }
        
        self.init(dictionary: dictionary)
    }
    
    public convenience init(data: Data) {
        var dictionary: [String : AnyObject]
        do {
            if let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : AnyObject] {
                dictionary = object
            } else {
                dictionary = [String : AnyObject]()
            }
        } catch {
            dictionary = [String : AnyObject]()
        }
        
        self.init(dictionary: dictionary)
    }
    
    public required init(dictionary: [String : AnyObject]) {
        if let value = dictionary[Keys.additionalType] as? String {
            self.additionalType = URL(string: value)
        }
        if let value = dictionary[Keys.alternativeName] as? String {
            self.alternativeName = value
        }
        if let value = dictionary[Keys.description] as? String {
            self.description = value
        }
        if let value = dictionary[Keys.disambiguatingDescription] as? String {
            self.disambiguatingDescription = value
        }
        if let value = dictionary[Keys.identifier] {
            self.identifier = makeIdentifier(anyObject: value)
        }
        if let value = dictionary[Keys.id] {
            self.identifier = makeIdentifier(anyObject: value)
        }
        if let value = dictionary[Keys.image] {
            self.image = makeImageObjectOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.mainEntityOfPage] {
            self.mainEntityOfPage = makeCreativeWorkOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.name] as? String {
            self.name = value
        }
        if let value = dictionary[Keys.potentialAction] as? [String : AnyObject] {
            self.potentialAction = SOAction(dictionary: value)
        }
        if let value = dictionary[Keys.sameAs] {
            self.sameAs = [URL]()
            
            if let typedValue = value as? [String] {
                for element in typedValue {
                    if let item = URL(string: element) {
                        self.sameAs?.append(item)
                    }
                }
            } else if let typedValue = value as? String {
                if let item = URL(string: typedValue) {
                    self.sameAs?.append(item)
                }
            }
        }
        if let value = dictionary[Keys.url] as? String {
            self.url = URL(string: value)
        }
    }
    
    public var dictionary: [String : AnyObject] {
        var dictionary = [String : AnyObject]()
        dictionary[Keys.context] = type(of: self).context as AnyObject
        dictionary[Keys.type] = type(of: self).type as AnyObject
        if let value = self.additionalType {
            dictionary[Keys.additionalType] = value.absoluteString as AnyObject
        }
        if let value = self.alternativeName {
            dictionary[Keys.alternativeName] = value as AnyObject
        }
        if let value = self.description {
            dictionary[Keys.description] = value as AnyObject
        }
        if let value = self.disambiguatingDescription {
            dictionary[Keys.disambiguatingDescription] = value as AnyObject
        }
        if let value = self.identifier?.dictionaryValue {
            dictionary[Keys.id] = value
        }
        if let value = self.image?.dictionaryValue {
            dictionary[Keys.image] = value
        }
        if let value = self.mainEntityOfPage?.dictionaryValue {
            dictionary[Keys.mainEntityOfPage] = value
        }
        if let value = self.potentialAction as? SOAction {
            dictionary[Keys.potentialAction] = value.dictionary as AnyObject
        }
        if let value = self.sameAs {
            var list = [String]()
            for element in value {
                list.append(element.absoluteString)
            }
            dictionary[Keys.sameAs] = list as AnyObject
        }
        if let value = self.url {
            dictionary[Keys.url] = value.absoluteString as AnyObject
        }
        return dictionary
    }
    
    public var data: Data {
        let dictionary = self.dictionary
        do {
            return try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
    
    public var json: String {
        let data = self.data
        guard let json = String(data: data, encoding: .utf8) else {
            return ""
        }
        
        return json
    }
}

public extension SOThing {
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
    
    /// Initialize an `CreativeWork` or `URL`
    internal func makeCreativeWorkOrURL(anyObject: AnyObject) -> CreativeWorkOrURL? {
        if let typedValue = anyObject as? [String : AnyObject], typedValue[Keys.type] as? String == SOCreativeWork.type {
            return SOCreativeWork(dictionary: typedValue)
        } else if let typedValue = anyObject as? String {
            return URL(string: typedValue)
        }
        
        return nil
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
    
    /// Initialize an `Int` or `Float`
    internal func makeNumber(anyObject: AnyObject) -> Number? {
        if let typedValue = anyObject as? Int {
            return typedValue
        } else if let typedValue = anyObject as? Float {
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
