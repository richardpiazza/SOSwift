import Foundation

/// An organization such as a school, NGO, corporation, club, etc.
public class SOOrganization: SOThing, Organization {
    public struct Keys {
        public static let address = "address"
        public static let aggregateRating = "aggregateRating"
        public static let alumni = "alumni"
        public static let areaServed = "areaServed"
        public static let award = "award"
        public static let brand = "brand"
        public static let contactPoint = "contactPoint"
        public static let department = "department"
        public static let dissolutionDate = "dissolutionDate"
        public static let duns = "duns"
        public static let email = "email"
        public static let employee = "employee"
        public static let event = "event"
        public static let faxNumber = "faxNumber"
        public static let founder = "founder"
        public static let foundingDate = "foundingDate"
        public static let foundingLocation = "foundingLocation"
        public static let funder = "funder"
        public static let globalLocationNumber = "globalLocationNumber"
        public static let hasOfferCatalog = "hasOfferCatalog"
        public static let hasPOS = "hasPOS"
        public static let isicV4 = "isicV4"
        public static let legalName = "legalName"
        public static let leiCode = "leiCode"
        public static let location = "location"
        public static let logo = "logo"
        public static let makesOffers = "makesOffers"
        public static let member = "member"
        public static let memberOf = "memberOf"
        public static let naics = "naics"
        public static let numberOfEmployees = "numberOfEmployees"
        public static let owns = "owns"
        public static let parentOrganization = "parentOrganization"
        public static let review = "review"
        public static let seeks = "seeks"
        public static let sponsor = "sponsor"
        public static let subOrganization = "subOrganization"
        public static let taxID = "taxID"
        public static let telephone = "telephone"
        public static let vatID = "vatID"
    }
    
    override public class var type: String {
        return "Organization"
    }
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// Alumni of an organization.
    /// Inverse property: alumniOf.
    public var alumni: [Person]?
    /// The geographic area where a service or offered item is provided.
    public var areaServed: AreaServed?
    /// An award won by or for this item
    public var award: [String]?
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    public var brand: [BrandOrOrganization]?
    /// A contact point for a person or organization.
    public var contactPoint: [ContactPoint]?
    /// A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.
    public var department: Organization?
    /// The date that this organization was dissolved.
    public var dissolutionDate: DateOnly?
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    public var duns: String?
    /// Email address.
    public var email: String?
    /// Someone working for this organization.
    public var employee: [Person]?
    /// Upcoming or past event associated with this place, organization, or action.
    public var event: [Event]?
    /// The fax number.
    public var faxNumber: String?
    /// A person who founded this organization.
    public var founder: [Person]?
    /// The date that this organization was founded.
    public var foundingDate: DateOnly?
    /// The place where the Organization was founded.
    public var foundingLocation: Place?
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    public var globalLocationNumber: String?
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    public var hasOfferCatalog: OfferCatalog?
    /// Points-of-Sales operated by the organization or person.
    public var hasPOS: [Place]?
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    public var isicV4: String?
    /// The official name of the organization, e.g. the registered company name.
    public var legalName: String?
    /// An organization identifier that uniquely identifies a legal entity as defined in ISO 17442.
    public var leiCode: String?
    /// The location of for example where the event is happening, an organization is located, or where an action takes place.
    public var location: PlaceOrPostalAddressOrText?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// A pointer to products or services offered by the organization or person.
    /// Inverse property: offeredBy.
    public var makesOffers: [Offer]?
    /// A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.
    /// Inverse property: memberOf.
    public var member: [OrganizationOrPerson]?
    /// An Organization (or ProgramMembership) to which this Person or Organization belongs.
    /// Inverse property: member.
    public var memberOf: OrganizationOrProgramMembership?
    /// The North American Industry Classification System (NAICS) code for a particular organization or business person.
    public var naics: String?
    /// The number of employees in an organization e.g. business.
    public var numberOfEmployees: QuantitativeValue?
    /// Products owned by the organization or person.
    public var owns: [OwnershipInfoOrProduct]?
    /// The larger organization that this organization is a subOrganization of, if any.
    /// Inverse property: subOrganization.
    public var parentOrganization: Organization?
    /// A review of the item.
    public var review: [Review]?
    /// A pointer to products or services sought by the organization or person (demand).
    public var seeks: [Demand]?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific 'department' property.
    /// Inverse property: parentOrganization.
    public var subOrganization: Organization?
    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
    public var taxID: String?
    /// The telephone number.
    public var telephone: String?
    /// The Value-added Tax ID of the organization or person.
    public var vatID: String?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.address] {
            self.address = makePostalAddressOrText(anyObject: value)
        }
        if let value = dictionary[Keys.aggregateRating] as? [String : AnyObject] {
            self.aggregateRating = SOAggregateRating(dictionary: value)
        }
        if let value = dictionary[Keys.alumni] {
            self.alumni = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.areaServed] {
            self.areaServed = makeAreaServed(anyObject: value)
        }
        if let value = dictionary[Keys.award] {
            self.award = makeStrings(anyObject: value)
        }
        if let value = dictionary[Keys.brand] {
            self.brand = makeBrandOrOgranizations(anyObject: value)
        }
        if let value = dictionary[Keys.contactPoint] {
            self.contactPoint = makeContactPoints(anyObject: value)
        }
        if let value = dictionary[Keys.department] as? [String : AnyObject] {
            self.department = SOOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.dissolutionDate] as? String {
            self.dissolutionDate = value
        }
        if let value = dictionary[Keys.duns] as? String {
            self.duns = value
        }
        if let value = dictionary[Keys.email] as? String {
            self.email = value
        }
        if let value = dictionary[Keys.employee] {
            self.employee = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.event] {
            self.event = makeEvents(anyObject: value)
        }
        if let value = dictionary[Keys.faxNumber] as? String {
            self.faxNumber = value
        }
        if let value = dictionary[Keys.founder] {
            self.founder = makePersons(anyObject: value)
        }
        if let value = dictionary[Keys.foundingDate] as? String {
            self.foundingDate = value
        }
        if let value = dictionary[Keys.foundingLocation] as? [String : AnyObject] {
            self.foundingLocation = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.funder] as? [String : AnyObject] {
            self.funder = makeOrganizationOrPerson(dictionary: value)
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
        if let value = dictionary[Keys.isicV4] as? String {
            self.isicV4 = value
        }
        if let value = dictionary[Keys.legalName] as? String {
            self.legalName = value
        }
        if let value = dictionary[Keys.leiCode] as? String {
            self.leiCode = value
        }
        if let value = dictionary[Keys.location] {
            self.location = makePlaceOrPostalAddressOrText(anyObject: value)
        }
        if let value = dictionary[Keys.logo] {
            self.logo = makeImageObjectOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.makesOffers] {
            self.makesOffers = makeOffers(anyObject: value)
        }
        if let value = dictionary[Keys.member] {
            self.member = makeOrganizationOrPersons(anyObject: value)
        }
        if let value = dictionary[Keys.memberOf] as? [String : AnyObject] {
            self.memberOf = makeOrganizationOrProgramMembership(dictionary: value)
        }
        if let value = dictionary[Keys.naics] as? String {
            self.naics = value
        }
        if let value = dictionary[Keys.numberOfEmployees] as? [String : AnyObject] {
            self.numberOfEmployees = SOQuantitativeValue(dictionary: value)
        }
        if let value = dictionary[Keys.owns] as? [[String : AnyObject]] {
            self.owns = makeOwnershipInfoOrProducts(elements: value)
        }
        if let value = dictionary[Keys.parentOrganization] as? [String : AnyObject] {
            self.parentOrganization = SOOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.review] {
            self.review = makeReviews(anyObject: value)
        }
        if let value = dictionary[Keys.seeks] {
            self.seeks = makeDemands(anyObject: value)
        }
        if let value = dictionary[Keys.sponsor] as? [String : AnyObject] {
            self.sponsor = makeOrganizationOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.subOrganization] as? [String : AnyObject] {
            self.subOrganization = SOOrganization(dictionary: value)
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
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.address?.dictionaryValue {
            dictionary[Keys.address] = value
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            dictionary[Keys.aggregateRating] = value.dictionary as AnyObject
        }
        if let value = self.alumni as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.alumni] = values as AnyObject
        }
        if let value = self.areaServed?.dictionaryValue {
            dictionary[Keys.areaServed] = value
        }
        if let value = self.award {
            dictionary[Keys.award] = value as AnyObject
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
        if let value = self.contactPoint as? [SOContactPoint] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.contactPoint] = values as AnyObject
        }
        if let value = self.department as? SOOrganization {
            dictionary[Keys.department] = value.dictionary as AnyObject
        }
        if let value = self.dissolutionDate as? String {
            dictionary[Keys.dissolutionDate] = value as AnyObject
        }
        if let value = self.duns {
            dictionary[Keys.duns] = value as AnyObject
        }
        if let value = self.email {
            dictionary[Keys.email] = value as AnyObject
        }
        if let value = self.employee as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.employee] = values as AnyObject
        }
        if let value = self.event as? [SOEvent] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.event] = values as AnyObject
        }
        if let value = self.faxNumber {
            dictionary[Keys.faxNumber] = value as AnyObject
        }
        if let value = self.founder as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.founder] = values as AnyObject
        }
        if let value = self.foundingDate as? String {
            dictionary[Keys.foundingDate] = value as AnyObject
        }
        if let value = self.foundingLocation as? SOPlace {
            dictionary[Keys.foundingLocation] = value.dictionary as AnyObject
        }
        if let value = self.funder?.dictionaryValue {
            dictionary[Keys.funder] = value
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
        if let value = self.isicV4 {
            dictionary[Keys.isicV4] = value as AnyObject
        }
        if let value = self.legalName {
            dictionary[Keys.legalName] = value as AnyObject
        }
        if let value = self.leiCode {
            dictionary[Keys.leiCode] = value as AnyObject
        }
        if let value = self.location?.dictionaryValue {
            dictionary[Keys.location] = value
        }
        if let value = self.logo?.dictionaryValue {
            dictionary[Keys.logo] = value
        }
        if let value = self.makesOffers as? [SOOffer] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.makesOffers] = values as AnyObject
        }
        if let value = self.member {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.member] = values as AnyObject
        }
        if let value = self.memberOf?.dictionaryValue {
            dictionary[Keys.memberOf] = value
        }
        if let value = self.naics {
            dictionary[Keys.naics] = value as AnyObject
        }
        if let value = self.numberOfEmployees as? SOQuantitativeValue {
            dictionary[Keys.numberOfEmployees] = value.dictionary as AnyObject
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
        if let value = self.parentOrganization as? SOOrganization {
            dictionary[Keys.parentOrganization] = value.dictionary as AnyObject
        }
        if let value = self.review as? [SOReview] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.review] = values as AnyObject
        }
        if let value = self.seeks as? [SODemand] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.seeks] = values as AnyObject
        }
        if let value = self.sponsor?.dictionaryValue {
            dictionary[Keys.sponsor] = value
        }
        if let value = self.subOrganization as? SOOrganization {
            dictionary[Keys.subOrganization] = value.dictionary as AnyObject
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
        return dictionary
    }
}
