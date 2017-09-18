import Foundation
import SOSwiftVocabulary

/// A person (alive, dead, undead, or fictional).
public class SOPerson: SOThing, Person {
    public struct Keys {
        public static let additionalName = "additionalName"
        public static let address = "address"
        public static let affiliation = "affiliation"
        public static let alumniOf = "alumniOf"
        public static let award = "award"
        public static let birthDate = "birthDate"
        public static let birthPlace = "birthPlace"
        public static let brand = "brand"
        public static let children = "children"
        public static let colleague = "colleague"
        public static let contactPoint = "contactPoint"
        public static let deathDate = "deathDate"
        public static let deathPlace = "deathPlace"
        public static let duns = "duns"
        public static let email = "email"
        public static let familyName = "familyName"
        public static let faxNumber = "faxNumber"
        public static let follows = "follows"
        public static let funder = "funder"
        public static let gender = "gender"
        public static let givenName = "givenName"
        public static let globalLocationNumber = "globalLocationNumber"
        public static let hasOfferCatalog = "hasOfferCatalog"
        public static let hasPOS = "hasPOS"
        public static let height = "height"
        public static let homeLocation = "homeLocation"
        public static let honorificPrefix = "honorificPrefix"
        public static let honorificSuffix = "honorificSuffix"
        public static let isicV4 = "isicV4"
        public static let jobTitle = "jobTitle"
        public static let knows = "knows"
        public static let makesOffer = "makesOffer"
        public static let memberOf = "memberOf"
        public static let naics = "naics"
        public static let nationality = "nationality"
        public static let netWorth = "netWorth"
        public static let owns = "owns"
        public static let parent = "parent"
        public static let performerIn = "performerIn"
        public static let relatedTo = "relatedTo"
        public static let seeks = "seeks"
        public static let sibling = "sibling"
        public static let sponsor = "sponsor"
        public static let spouse = "spouse"
        public static let taxID = "taxID"
        public static let telephone = "telephon"
        public static let vatID = "vatID"
        public static let weight = "weight"
        public static let workLocation = "workLocation"
        public static let worksFor = "worksFor"
    }
    
    override public class var type: String {
        return "Person"
    }
    
    /// An additional name for a Person, can be used for a middle name.
    public var additionalName: String?
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    /// An organization that this person is affiliated with. For example, a school/university, a club, or a team.
    public var affiliation: Organization?
    /// An organization that the person is an alumni of. Inverse property: alumni.
    public var alumniOf: EducationalOrganizationOrOrganization?
    /// An award won by or for this item.
    public var award: [String]?
    /// Date of birth.
    public var birthDate: DateOnly?
    /// The place where the person was born.
    public var birthPlace: Place?
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    public var brand: [BrandOrOrganization]?
    /// A child of the person.
    public var children: [Person]?
    /// A colleague of the person.
    public var colleague: [PersonOrURL]?
    /// A contact point for a person or organization.
    public var contactPoint: [ContactPoint]?
    /// Date of death.
    public var deathDate: DateOnly?
    /// The place where the person died.
    public var deathPlace: Place?
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    public var duns: String?
    /// Email address.
    public var email: String?
    /// Family name. In the U.S., the last name of an Person. This can be used along with givenName instead of the name property.
    public var familyName: String?
    /// The fax number.
    public var faxNumber: String?
    /// The most generic uni-directional social relation.
    public var follows: [Person]?
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    /// Gender of the person. While http://schema.org/Male and http://schema.org/Female may be used, text strings are also acceptable for people who do not identify as a binary gender.
    public var gender: GenderOrText?
    /// Given name. In the U.S., the first name of a Person. This can be used along with familyName instead of the name property.
    public var givenName: String?
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    public var globalLocationNumber: String?
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    public var hasOfferCatalog: OfferCatalog?
    /// Points-of-Sales operated by the organization or person.
    public var hasPOS: [Place]?
    /// The height of the item.
    public var height: DistanceOrQuantitativeValue?
    /// A contact location for a person's residence.
    public var homeLocation: ContactPointOrPlace?
    /// An honorific prefix preceding a Person's name such as Dr/Mrs/Mr.
    public var honorificPrefix: String?
    /// An honorific suffix preceding a Person's name such as M.D. /PhD/MSCSW.
    public var honorificSuffix: String?
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    public var isicV4: String?
    /// The job title of the person (for example, Financial Manager).
    public var jobTitle: String?
    /// The most generic bi-directional social/work relation.
    public var knows: [Person]?
    /// A pointer to products or services offered by the organization or person. Inverse property: offeredBy.
    public var makesOffer: [Offer]?
    /// An Organization (or ProgramMembership) to which this Person or Organization belongs. Inverse property: member.
    public var memberOf: [OrganizationOrProgramMembership]?
    /// The North American Industry Classification System (NAICS) code for a particular organization or business person.
    public var naics: String?
    /// Nationality of the person.
    public var nationality: Country?
    /// The total financial value of the person as calculated by subtracting assets from liabilities.
    public var netWorth: MonetaryAmountOrPriceSpecification?
    /// Products owned by the organization or person.
    public var owns: [ProductOrService]?
    /// A parent of this person.
    public var parent: [Person]?
    /// Event that this person is a performer or participant in.
    public var performerIn: Event?
    /// The most generic familial relation.
    public var relatedTo: [Person]?
    /// A pointer to products or services sought by the organization or person (demand).
    public var seeks: [Demand]?
    /// A sibling of the person.
    public var sibling: [Person]?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// The person's spouse.
    public var spouse: Person?
    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
    public var taxID: String?
    /// The telephone number.
    public var telephone: String?
    /// The Value-added Tax ID of the organization or person.
    public var vatID: String?
    /// The weight of the product or person.
    public var weight: QuantitativeValue?
    /// A contact location for a person's place of work.
    public var workLocation: ContactPointOrPlace?
    /// Organizations that the person works for.
    public var worksFor: [Organization]?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.additionalName] as? String {
            self.additionalName = value
        }
        if let value = dictionary[Keys.address] {
            self.address = makePostalAddressOrText(anyObject: value)
        }
        if let value = dictionary[Keys.affiliation] as? [String : AnyObject] {
            self.affiliation = SOOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.alumniOf] as? [String : AnyObject] {
            self.alumniOf = makeEducationalOrganizationOrOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.award] {
            self.award = makeStrings(anyObject: value)
        }
        if let value = dictionary[Keys.birthDate] as? String {
            self.birthDate = value
        }
        if let value = dictionary[Keys.birthPlace] as? [String : AnyObject] {
            self.birthPlace = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.brand] {
            self.brand = makeBrandOrOgranizations(anyObject: value)
        }
        if let value = dictionary[Keys.children] {
            self.children = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.colleague] {
            self.colleague = makePersonOrURLs(anyObject: value)
        }
        if let value = dictionary[Keys.contactPoint] {
            self.contactPoint = makeContactPoints(anyObject: value)
        }
        if let value = dictionary[Keys.deathDate] as? String {
            self.deathDate = value
        }
        if let value = dictionary[Keys.deathPlace] as? [String : AnyObject] {
            self.deathPlace = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.duns] as? String {
            self.duns = value
        }
        if let value = dictionary[Keys.email] as? String {
            self.email = value
        }
        if let value = dictionary[Keys.familyName] as? String {
            self.familyName = value
        }
        if let value = dictionary[Keys.faxNumber] as? String {
            self.faxNumber = value
        }
        if let value = dictionary[Keys.follows] {
            self.follows = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.funder] as? [String : AnyObject] {
            self.funder = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.gender] as? String {
            if let typedValue = Gender(rawValue: value) {
                self.gender = typedValue
            } else {
                self.gender = value
            }
        }
        if let value = dictionary[Keys.givenName] as? String {
            self.givenName = value
        }
        if let value = dictionary[Keys.globalLocationNumber] as? String {
            self.globalLocationNumber = value
        }
        if let value = dictionary[Keys.hasOfferCatalog] as? [String : AnyObject] {
            self.hasOfferCatalog = SOOfferCatalog(dictionary: value)
        }
        if let value = dictionary[Keys.hasPOS] {
            self.hasPOS = makePlaces(anyObject: value)
        }
        if let value = dictionary[Keys.height] as? [String : AnyObject] {
            self.height = makeDistanceOrQuantitativeValue(dictionary: value)
        }
        if let value = dictionary[Keys.homeLocation] as? [String : AnyObject] {
            self.homeLocation = makeContactPointOrPlace(dictionary: value)
        }
        if let value = dictionary[Keys.honorificPrefix] as? String {
            self.honorificPrefix = value
        }
        if let value = dictionary[Keys.honorificSuffix] as? String {
            self.honorificSuffix = value
        }
        if let value = dictionary[Keys.isicV4] as? String {
            self.isicV4 = value
        }
        if let value = dictionary[Keys.jobTitle] as? String {
            self.jobTitle = value
        }
        if let value = dictionary[Keys.knows] {
            self.knows = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.makesOffer] {
            self.makesOffer = makeOffers(anyObject: value)
        }
        if let value = dictionary[Keys.memberOf] {
            self.memberOf = makeOrganizationOrProgramMemberships(anyObject: value)
        }
        if let value = dictionary[Keys.naics] as? String {
            self.naics = value
        }
        if let value = dictionary[Keys.nationality] as? [String : AnyObject] {
            self.nationality = SOCountry(dictionary: value)
        }
        if let value = dictionary[Keys.netWorth] as? [String : AnyObject] {
            self.netWorth = makeMonetaryAmountOrPriceSpecification(dictionary: value)
        }
        if let value = dictionary[Keys.owns] {
            self.owns = makeProductOrServices(anyObject: value)
        }
        if let value = dictionary[Keys.parent] {
            self.parent = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.performerIn] as? [String : AnyObject] {
            self.performerIn = SOEvent(dictionary: value)
        }
        if let value = dictionary[Keys.relatedTo] {
            self.relatedTo = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.seeks] {
            self.seeks = makeDemands(anyObject: value)
        }
        if let value = dictionary[Keys.sibling] {
            self.sibling = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.sponsor] as? [String : AnyObject] {
            self.sponsor = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.spouse] as? [String : AnyObject] {
            self.spouse = SOPerson(dictionary: value)
        }
        if let value = dictionary[Keys.taxID] as? String {
            self.taxID = value
        }
        if let value = dictionary[Keys.telephone] as? String {
            self.telephone = value
        }
        if let value = dictionary[Keys.vatID] as? String {
            self.vatID = value
        }
        if let value = dictionary[Keys.weight] as? [String : AnyObject] {
            self.weight = SOQuantitativeValue(dictionary: value)
        }
        if let value = dictionary[Keys.workLocation] as? [String : AnyObject] {
            self.workLocation = makeContactPointOrPlace(dictionary: value)
        }
        if let value = dictionary[Keys.worksFor] {
            self.worksFor = makeOrganizations(anyObject: value)
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.additionalName {
            dictionary[Keys.additionalName] = value as AnyObject
        }
        if let value = self.address?.dictionaryValue {
            dictionary[Keys.address] = value
        }
        if let value = self.affiliation as? SOOrganization {
            dictionary[Keys.affiliation] = value.dictionary as AnyObject
        }
        if let value = self.alumniOf?.dictionaryValue {
            dictionary[Keys.alumniOf] = value
        }
        if let value = self.award {
            dictionary[Keys.award] = value as AnyObject
        }
        if let value = self.birthDate as? String {
            dictionary[Keys.birthDate] = value as AnyObject
        }
        if let value = self.birthPlace as? SOPlace {
            dictionary[Keys.birthPlace] = value.dictionary as AnyObject
        }
        if let value = self.brand {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.brand] = values as AnyObject
        }
        if let value = self.children as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.children] = values as AnyObject
        }
        if let value = self.colleague {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.colleague] = values as AnyObject
        }
        if let value = self.contactPoint as? [SOContactPoint] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.contactPoint] = values as AnyObject
        }
        if let value = self.deathDate as? String {
            dictionary[Keys.deathDate] = value as AnyObject
        }
        if let value = self.deathPlace as? SOPlace {
            dictionary[Keys.deathPlace] = value.dictionary as AnyObject
        }
        if let value = self.duns {
            dictionary[Keys.duns] = value as AnyObject
        }
        if let value = self.email {
            dictionary[Keys.email] = value as AnyObject
        }
        if let value = self.familyName {
            dictionary[Keys.familyName] = value as AnyObject
        }
        if let value = self.faxNumber {
            dictionary[Keys.faxNumber] = value as AnyObject
        }
        if let value = self.follows as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.follows] = values as AnyObject
        }
        if let value = self.funder?.dictionaryValue {
            dictionary[Keys.funder] = value
        }
        if let value = self.gender?.dictionaryValue {
            dictionary[Keys.gender] = value
        }
        if let value = self.givenName {
            dictionary[Keys.givenName] = value as AnyObject
        }
        if let value = self.globalLocationNumber {
            dictionary[Keys.globalLocationNumber] = value as AnyObject
        }
        if let value = self.hasOfferCatalog as? SOOfferCatalog {
            dictionary[Keys.hasOfferCatalog] = value.dictionary as AnyObject
        }
        if let value = self.hasPOS as? [SOPlace] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.hasPOS] = values as AnyObject
        }
        if let value = self.height?.dictionaryValue {
            dictionary[Keys.height] = value
        }
        if let value = self.homeLocation?.dictionaryValue {
            dictionary[Keys.homeLocation] = value
        }
        if let value = self.honorificPrefix {
            dictionary[Keys.honorificPrefix] = value as AnyObject
        }
        if let value = self.honorificSuffix {
            dictionary[Keys.honorificSuffix] = value as AnyObject
        }
        if let value = self.isicV4 {
            dictionary[Keys.isicV4] = value as AnyObject
        }
        if let value = self.jobTitle {
            dictionary[Keys.jobTitle] = value as AnyObject
        }
        if let value = self.knows as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.knows] = values as AnyObject
        }
        if let value = self.makesOffer as? [SOOffer] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.makesOffer] = values as AnyObject
        }
        if let value = self.memberOf {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.memberOf] = values as AnyObject
        }
        if let value = self.naics {
            dictionary[Keys.naics] = value as AnyObject
        }
        if let value = self.nationality as? SOCountry {
            dictionary[Keys.nationality] = value.dictionary as AnyObject
        }
        if let value = self.netWorth?.dictionaryValue {
            dictionary[Keys.netWorth] = value
        }
        if let value = self.owns {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.owns] = values as AnyObject
        }
        if let value = self.parent as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.parent] = values as AnyObject
        }
        if let value = self.performerIn as? SOEvent {
            dictionary[Keys.performerIn] = value.dictionary as AnyObject
        }
        if let value = self.relatedTo as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.relatedTo] = values as AnyObject
        }
        if let value = self.seeks as? [SODemand] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.seeks] = values as AnyObject
        }
        if let value = self.sibling as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.sibling] = values as AnyObject
        }
        if let value = self.sponsor?.dictionaryValue {
            dictionary[Keys.sponsor] = value
        }
        if let value = self.spouse as? SOPerson {
            dictionary[Keys.spouse] = value.dictionary as AnyObject
        }
        if let value = self.taxID {
            dictionary[Keys.taxID] = value as AnyObject
        }
        if let value = self.telephone {
            dictionary[Keys.telephone] = value as AnyObject
        }
        if let value = self.vatID {
            dictionary[Keys.vatID] = value as AnyObject
        }
        if let value = self.weight as? SOQuantitativeValue {
            dictionary[Keys.weight] = value.dictionary as AnyObject
        }
        if let value = self.workLocation?.dictionaryValue {
            dictionary[Keys.workLocation] = value
        }
        if let value = self.worksFor as? [SOOrganization] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.worksFor] = values as AnyObject
        }
        return dictionary
    }
}
