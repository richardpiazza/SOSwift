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
    
    public init() {
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
            if let typedValue = value as? [String : AnyObject], typedValue[Keys.type] as? String == SOPropertyValue.type {
                self.identifier = SOPropertyValue(dictionary: typedValue)
            } else if let typedValue = value as? String, typedValue.contains("://") {
                self.identifier = URL(string: typedValue)
            } else if let typedValue = value as? String {
                self.identifier = typedValue
            }
        }
        if let value = dictionary[Keys.id] {
            if let typedValue = value as? [String : AnyObject], typedValue[Keys.type] as? String == SOPropertyValue.type {
                self.identifier = SOPropertyValue(dictionary: typedValue)
            } else if let typedValue = value as? String, typedValue.contains("://") {
                self.identifier = URL(string: typedValue)
            } else if let typedValue = value as? String {
                self.identifier = typedValue
            }
        }
        if let value = dictionary[Keys.image] {
            if let typedValue = value as? [String : AnyObject], typedValue[Keys.type] as? String == SOImageObject.type {
                self.image = SOImageObject(dictionary: typedValue)
            } else if let typedValue = value as? String {
                self.image = URL(string: typedValue)
            }
        }
        if let value = dictionary[Keys.mainEntityOfPage] as? CreativeWorkOrURL {
            if let typedValue = value as? [String : AnyObject], typedValue[Keys.type] as? String == SOCreativeWork.type {
                self.mainEntityOfPage = SOCreativeWork(dictionary: typedValue)
            } else if let typedValue = value as? String {
                self.mainEntityOfPage = URL(string: typedValue)
            }
        }
        if let value = dictionary[Keys.name] as? String {
            self.name = value
        }
        if let value = dictionary[Keys.potentialAction] as? SOAction {
            self.potentialAction = value
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
        if let value = self.identifier {
            if let typedValue = value as? SOPropertyValue {
                dictionary[Keys.id] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? URL {
                dictionary[Keys.id] = typedValue.absoluteString as AnyObject
            } else if let typedValue = value as? String {
                dictionary[Keys.id] = typedValue as AnyObject
            }
        }
        if let value = self.image {
            if let typedValue = value as? SOImageObject {
                dictionary[Keys.image] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? URL {
                dictionary[Keys.image] = typedValue.absoluteString as AnyObject
            }
        }
        if let value = self.mainEntityOfPage {
            if let typedValue = value as? SOCreativeWork {
                dictionary[Keys.mainEntityOfPage] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? URL {
                dictionary[Keys.mainEntityOfPage] = typedValue.absoluteString as AnyObject
            }
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
