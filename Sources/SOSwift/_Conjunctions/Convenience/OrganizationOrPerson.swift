public typealias OrganizationOrPerson = SingleSchemaConjunction<Organization, Person>

public extension OrganizationOrPerson {
    var organization: Organization? { first }
    var person: Person? { second }
    
    static func organization(value: Organization) -> Self {
        .first(value)
    }
    
    static func person(value: Person) -> Self {
        .second(value)
    }
}
